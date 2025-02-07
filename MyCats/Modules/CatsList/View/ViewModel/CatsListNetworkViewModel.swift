//
//  CatsListNetworkViewModel.swift
//  MyCats
//
//  Created by Alma Viva on 06/02/25.
//

import SwiftUI
import Combine

fileprivate let catsPageSize = 10
fileprivate let catsSkipCount = 0

class CatsListNetworkViewModel: CatsListViewModel {
    @Published var cats = [CatModel]()
    @Published var viewState: CatsListViewState = .loading
    private var skipCount = 0
    @Published var tagsSearch = ""
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        $tagsSearch
            .debounce(for: 1, scheduler: RunLoop.main)
            .sink { [weak self] _ in
                guard let self = self else { return }
                guard !tagsSearch.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
                Task {
                    debugPrint("Searching \(self.tagsSearch)")
                    await self.requestCats(filteringByTags: self.tagsSearch)
                }
            }
            .store(in: &cancellables)
    }
    
    @MainActor
    func requestCats(nextPage: Bool) async {
        if nextPage {
            await requestMoreCats(filteringByTags: tagsSearch)
        } else {
            await requestCats(filteringByTags: tagsSearch)
        }
    }
    
    @MainActor
    private func requestMoreCats(filteringByTags tags: String?) async {
        skipCount += catsPageSize
        do {
            let cats = try await createCatsRequest(filteringByTags: tags)(catsPageSize, skipCount)
            let moreCats: [CatModel] = cats.map { .init(
                id: $0.id,
                tags: $0.tags,
                image: nil
            ) }
            self.cats.append(contentsOf: moreCats)
            viewState = .ready
        } catch {
            viewState = .error(error)
        }
    }
    
    @MainActor
    private func requestCats(filteringByTags tags: String? = nil) async {
        do {
            let cats = try await createCatsRequest(filteringByTags: tags)(catsPageSize, skipCount)
            self.cats = cats.map { .init(
                id: $0.id,
                tags: $0.tags,
                image: nil
            ) }
            viewState = .ready
        } catch {
            viewState = .error(error)
        }
    }
    
    @MainActor
    private func createCatsRequest(filteringByTags tags: String?) async -> (_ limit: Int, _ skip: Int) async throws -> [CatResponse] {
        if let tags = processTagSearchString(tags: tags) {
            return { (_ limit: Int, _ skip: Int) async throws -> [CatResponse] in
                if skip > 0 {
                    self.viewState = .loadingMoreCats
                } else {
                    self.viewState = .loadingTags
                }
                return try await CATAAS.Service.requestCats(limit: limit, skip: skip, filteringByTags: tags)
            }
        } else {
            return { (_ limit: Int, _ skip: Int) async throws -> [CatResponse] in
                if skip > 0 {
                    self.viewState = .loadingMoreCats
                } else {
                    self.viewState = .loading
                }
                return try await CATAAS.Service.requestCats(limit: limit, skip: skip)
            }
        }
    }
    
    private func processTagSearchString(tags: String? = nil) -> [String]? {
        guard let tags = tags else { return nil }
        let trimmed = tags.trimmingCharacters(in: .whitespacesAndNewlines)
        let splitted = trimmed.split(separator: " ")
        guard !splitted.isEmpty else { return nil }
        return splitted.map { $0.lowercased() }
    }
    
    @MainActor
    func requestImage(for cat: CatModel) async {
        do {
            let imageData = try await CATAAS.Service.requestImage(catId: cat.id)
            guard let index = cats.firstIndex(where: { $0.id == cat.id }) else { return }
            guard let uiImage = UIImage(data: imageData) else { return }
            cats[index].image = .init(uiImage: uiImage)
        } catch {
            debugPrint("An error occured when fething cat's image.")
        }
    }
}
