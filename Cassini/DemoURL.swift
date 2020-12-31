//
//  DemoURL.swift
//  Cassini
//
//  Created by Hyeonuk Shin on 2020/12/31.
//

import Foundation

struct DemoURL {
	static let Stanford = "https://mse.stanford.edu/sites/g/files/sbiybj17106/files/styles/breakpoint_2xl_2x/public/media/image/banner-cfr-p4-9-min_0.jpg?itok=2ufH-8u_"

	static let NASA:  [String: String] = [
		"Cassini" : "http://www.jpl.nasa.gov/images/cassini/20090202/pia03883-full.jpg",
		"Earth" : "http://www.nasa.gov/sites/default/files/wave_earth_mosaic_3.jpg",
		"Saturn" : "http://www.nasa.gov/sites/default/files/saturn_collage.jpg"]
	

	static func NSAImageNamed(imageName: String?) -> URL? {
		if let urlString = NASA[imageName ?? ""] {
			return URL(string: urlString)
		} else {
			return nil
		}
	}

}
