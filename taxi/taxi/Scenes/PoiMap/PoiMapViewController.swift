//
//  PoiMapViewController.swift
//  taxi
//
//  Created by OMER YASIN KOLKANAT on 9.12.2018.
//  Copyright © 2018 Omer Kolkanat. All rights reserved.
//

import MapKit
import CoreLocation

class PoiMapViewController: UIViewController {
    
    @objc var poi: Poi!
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var locateMeButton: UIButton!
    private var locationManager: CLLocationManager!
    
    private let viewModel = PoiMapViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewModel()
        setupUI()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if locationManager != nil {
            mapView.showsUserLocation = false
            locationManager.stopUpdatingLocation()
        }
    }
    
    @IBAction func locateMeButtonTapped(_ sender: Any) {
        let region = MKCoordinateRegion(center: mapView.userLocation.coordinate,
                                        span: Const.coordinateSpan)
        mapView.region = region
    }
    
}

// MARK: - Private extension
private extension PoiMapViewController {
    enum Const {
        static let coordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1,
                                                     longitudeDelta: 0.1)
        static let annotationImageSize = CGSize(width: 40,
                                                height: 40)
    }
    
    func setupUI() {
        mapView.delegate = self
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        mapView.showsUserLocation = true
        let center = CLLocationCoordinate2D(latitude: poi.coordinate.latitude,
                                            longitude: poi.coordinate.longitude)
        let region = MKCoordinateRegion(center: center,
                                        span: Const.coordinateSpan)
        mapView.setRegion(region, animated: true)
    }
    
    func setupViewModel() {
        viewModel.stateChangeHandler = handleStateChange
        viewModel.errorHandler = handleError
    }
    
    func handleStateChange(change: PoiListState.Change) {
        switch change {
        case .poiListReloaded:
            mapView.removeAnnotations(mapView.annotations)
            
            if let poiList = viewModel.state.pois {
                for poi in poiList {
                    mapView.addAnnotation(poi)
                }
            }
        }
    }
    
    func handleError(error: PoiListState.Exception) {
        switch error {
        case .fetchFailed:
            AlertHelper.showNetworkErrorAlert(fromController: self)
        }
    }
    
}

// MARK: - MKMapViewDelegate
extension PoiMapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation {
            return nil
        }
        
        let annotationView = MKAnnotationView(annotation: annotation,
                                              reuseIdentifier: "Poi")
        
        if let poi = annotation as? Poi {
            var image: UIImage?
            if poi.fleetType == .taxi {
                image = UIImage(named: "taxi")
            } else {
                image = UIImage(named: "pooling")
            }
            annotationView.image = image?.resizeImage(size: Const.annotationImageSize)
            annotationView.transform = CGAffineTransform(rotationAngle: poi.heading)
        }
        
        return annotationView

    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let northEast = mapView.convert(CGPoint(x: mapView.bounds.width, y: 0),
                                        toCoordinateFrom: mapView)
        let southWest = mapView.convert(CGPoint(x: 0, y: mapView.bounds.height),
                                        toCoordinateFrom: mapView)
        viewModel.fetchPois(point1: northEast, point2: southWest)
    }
    
}

extension PoiMapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .denied, .restricted, .notDetermined:
            locateMeButton.isHidden = true
        case .authorizedAlways, .authorizedWhenInUse:
            locateMeButton.isHidden = false
        }
    }
}

extension Poi: MKAnnotation {
    //To use poi data in viewFor annotation method
}
