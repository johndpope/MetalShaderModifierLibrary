//
//  ShaderModifierDataSource.swift
//  ShaderModifierLibrary
//
//  Created by Dennis Ippel on 30/01/2019.
//  Copyright © 2019 Rozengain. All rights reserved.
//

import UIKit
import SceneKit

enum TargetMeshType {
    case cube
    case quad
    case sphere
    case suzanne
}

struct ShaderModifierEntity {
    var name: String
    var previewImage: UIImage
    var shaderModifier: String
    var entryPoint: SCNShaderModifierEntryPoint
    var targetMeshType: TargetMeshType
}

class ShaderModifierDataSource {
    public var shaderModifiers: [ShaderModifierEntity]
    
    init() {
        shaderModifiers = [ShaderModifierEntity]()
        populateArray()
    }
    
    private func populateArray() {
        shaderModifiers.append(
            ShaderModifierEntity(
                name: "Circle",
                previewImage: image(named: "icon_circle"),
                shaderModifier: shaderModifier(named: "circle"),
                entryPoint: .fragment,
                targetMeshType: .quad))
        shaderModifiers.append(
            ShaderModifierEntity(
                name: "Circle 2",
                previewImage: image(named: "icon_circle"),
                shaderModifier: shaderModifier(named: "circle"),
                entryPoint: .fragment,
                targetMeshType: .quad))
    }
    
    private func image(named imageName: String) -> UIImage {
        return UIImage(named: imageName, in: Bundle.main, compatibleWith: nil)!
    }
    
    private func shaderModifier(named shaderModifierName: String) -> String {
        return try! String(contentsOfFile: Bundle.main.path(forResource: "circle", ofType: "shader")!, encoding: String.Encoding.utf8)
    }
}