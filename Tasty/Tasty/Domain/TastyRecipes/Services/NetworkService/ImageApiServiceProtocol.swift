//  ImageApiServiceProtocol.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Протокол сервиса загрузки изображений
protocol ImageApiServiceProtocol {
    func fetchData(from url: URL) async throws -> Data
}
