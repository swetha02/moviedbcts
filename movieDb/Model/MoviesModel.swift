//
//  movieDb
//
//  Created by swetha on 10/21/21. 
//  Copyright © 2021 swetha. All rights reserved.
//

import Foundation

struct MoviesModel: Codable {

    let page: Int?
    let results: [Results]?
    let totalPages: Int?
    let totalResults: Int?

    private enum CodingKeys: String, CodingKey {
        case page = "page"
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        page = try values.decodeIfPresent(Int.self, forKey: .page)
        results = try values.decodeIfPresent([Results].self, forKey: .results)
        totalPages = try values.decodeIfPresent(Int.self, forKey: .totalPages)
        totalResults = try values.decodeIfPresent(Int.self, forKey: .totalResults)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(page, forKey: .page)
        try container.encode(results, forKey: .results)
        try container.encode(totalPages, forKey: .totalPages)
        try container.encode(totalResults, forKey: .totalResults)
    }
    
    
    struct Results: Codable {

        let adult: Bool?
        let genreIds: [Int]?
        let id: Int?
        let originalLanguage: String?
        let originalTitle: String?
        let overview: String?
        let popularity: Double?
        let posterPath: String?
        let releaseDate: String?
        let title: String?
        let video: Bool?
        let voteAverage: Double?
        let voteCount: Int?

        private enum CodingKeys: String, CodingKey {
            case adult = "adult"
            case genreIds = "genre_ids"
            case id = "id"
            case originalLanguage = "original_language"
            case originalTitle = "original_title"
            case overview = "overview"
            case popularity = "popularity"
            case posterPath = "poster_path"
            case releaseDate = "release_date"
            case title = "title"
            case video = "video"
            case voteAverage = "vote_average"
            case voteCount = "vote_count"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            adult = try values.decodeIfPresent(Bool.self, forKey: .adult)
            genreIds = try values.decodeIfPresent([Int].self, forKey: .genreIds)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            originalLanguage = try values.decodeIfPresent(String.self, forKey: .originalLanguage)
            originalTitle = try values.decodeIfPresent(String.self, forKey: .originalTitle)
            overview = try values.decodeIfPresent(String.self, forKey: .overview)
            popularity = try values.decodeIfPresent(Double.self, forKey: .popularity)
            posterPath = try values.decodeIfPresent(String.self, forKey: .posterPath)
            releaseDate = try values.decodeIfPresent(String.self, forKey: .releaseDate)
            title = try values.decodeIfPresent(String.self, forKey: .title)
            video = try values.decodeIfPresent(Bool.self, forKey: .video)
            voteAverage = try values.decodeIfPresent(Double.self, forKey: .voteAverage)
            voteCount = try values.decodeIfPresent(Int.self, forKey: .voteCount)
        }

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(adult, forKey: .adult)
            try container.encode(genreIds, forKey: .genreIds)
            try container.encode(id, forKey: .id)
            try container.encode(originalLanguage, forKey: .originalLanguage)
            try container.encode(originalTitle, forKey: .originalTitle)
            try container.encode(overview, forKey: .overview)
            try container.encode(popularity, forKey: .popularity)
            try container.encode(posterPath, forKey: .posterPath)
            try container.encode(releaseDate, forKey: .releaseDate)
            try container.encode(title, forKey: .title)
            try container.encode(video, forKey: .video)
            try container.encode(voteAverage, forKey: .voteAverage)
            try container.encode(voteCount, forKey: .voteCount)
        }

    }

}

