//
//  MapViewController.swift
//  Swift-Tutorial
//
//  Created by Ilya Glazunov on 31.05.2020.
//Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import UIKit
import Mapbox

class MapViewController: UIViewController {
    var presenter: MapPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "mapbox://styles/mapbox/streets-v11")
        let mapView = MGLMapView(frame: view.bounds, styleURL: url)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.delegate = self
        mapView.setCenter(CLLocationCoordinate2D(latitude: 53.2403, longitude: 50.2026), zoomLevel: 13, animated: false)
        view.addSubview(mapView)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension MapViewController: MGLMapViewDelegate {
    func mapView(_ mapView: MGLMapView, didFinishLoading style: MGLStyle) {
        // Create point to represent where the symbol should be placed
        let point = MGLPointAnnotation()
        point.coordinate = CLLocationCoordinate2D(latitude: 53.241096, longitude: 50.206349)

        // Create a data source to hold the point data
        let shapeSource = MGLShapeSource(identifier: "marker-source", shape: point, options: nil)

        // Create a style layer for the symbol
        let shapeLayer = MGLSymbolStyleLayer(identifier: "marker-style", source: shapeSource)


        // Add the image to the style's sprite
        if let image = UIImage(named: "gasStationIcon") {
            style.setImage(image, forName: "home-symbol")
        }

        // Tell the layer to use the image in the sprite
        shapeLayer.iconImageName = NSExpression(forConstantValue: "home-symbol")

        // Add the source and style layer to the map
        style.addSource(shapeSource)
        style.addLayer(shapeLayer)
        mapView.addAnnotation(point)
    }

    func mapView(_ mapView: MGLMapView, didSelect annotation: MGLAnnotation) {
        presenter.didSelectAnotation()
    }
}
