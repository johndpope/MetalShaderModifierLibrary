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

struct ShaderModifiersEntity {
    var name: String
    var shaderModifiers: [SCNShaderModifierEntryPoint: String]
    var targetMeshType: TargetMeshType
    
    var backgroundImageName: String?
    var textures: [String: String]?
}

class ShaderModifierDataSource {
    public var shaderModifiers: [ShaderModifiersEntity]
    
    init() {
        shaderModifiers = [ShaderModifiersEntity]()
        populateArray()
    }
    
    private func populateArray() {
        shaderModifiers.append(
            ShaderModifiersEntity(
               name: "Texture Arguments",
               shaderModifiers: [
                   SCNShaderModifierEntryPoint.fragment: shaderModifier(named: "texture_arguments.fragment")
               ],
               targetMeshType: .cube,
               textures: ["texture1": "uv_grid.jpg", "texture2": "ChristmasTreeOrnament02_col.jpg"]
               ))
        shaderModifiers.append(
            ShaderModifiersEntity(
               name: "Raymarched Shaded Torus",
               shaderModifiers: [
                   SCNShaderModifierEntryPoint.lightingModel: shaderModifier(named: "raymarching_torus_shading.lightingModel"),
                   SCNShaderModifierEntryPoint.geometry: shaderModifier(named: "raymarching_torus.geometry")
               ],
               targetMeshType: .cube))
        shaderModifiers.append(
            ShaderModifiersEntity(
                name: "Raymarched Torus",
                shaderModifiers: [
                    SCNShaderModifierEntryPoint.fragment: shaderModifier(named: "raymarching_torus.fragment"),
                    SCNShaderModifierEntryPoint.geometry: shaderModifier(named: "raymarching_torus.geometry")
                ],
                targetMeshType: .cube))
        shaderModifiers.append(
            ShaderModifiersEntity(
                name: "Circle",
                shaderModifiers: [SCNShaderModifierEntryPoint.fragment: shaderModifier(named: "circle.fragment")],
                targetMeshType: .quad))
        shaderModifiers.append(
            ShaderModifiersEntity(
                name: "Multiple circles",
                shaderModifiers: [SCNShaderModifierEntryPoint.fragment: shaderModifier(named: "multi_circle.fragment")],
                targetMeshType: .quad))
        shaderModifiers.append(
            ShaderModifiersEntity(
                name: "Zoom",
                shaderModifiers: [SCNShaderModifierEntryPoint.geometry: shaderModifier(named: "zoom.geometry")],
                targetMeshType: .quad,
                backgroundImageName: "uv_grid.jpg"))
        shaderModifiers.append(
            ShaderModifiersEntity(
                name: "Visualize Normals",
                shaderModifiers: [SCNShaderModifierEntryPoint.fragment: shaderModifier(named: "normals_visualized.fragment")],
                targetMeshType: .suzanne))
        shaderModifiers.append(
            ShaderModifiersEntity(
                name: "Extrude Along Normal",
                shaderModifiers: [SCNShaderModifierEntryPoint.geometry: shaderModifier(named: "extrude_along_normal.geometry")],
                targetMeshType: .suzanne))
        shaderModifiers.append(
            ShaderModifiersEntity(
                name: "Horizontal Stripes",
                shaderModifiers: [
                    SCNShaderModifierEntryPoint.fragment: shaderModifier(named: "horizontal_stripes.fragment"),
                    SCNShaderModifierEntryPoint.geometry: shaderModifier(named: "horizontal_stripes.geometry"),
                ],
                targetMeshType: .suzanne))
        shaderModifiers.append(
            ShaderModifiersEntity(
                name: "Speedometer",
                shaderModifiers: [
                    SCNShaderModifierEntryPoint.fragment: shaderModifier(named: "speedometer.fragment")
                ],
                targetMeshType: .quad))
    }
    
    private func image(named imageName: String) -> UIImage {
        return UIImage(named: imageName, in: Bundle.main, compatibleWith: nil)!
    }
    
    private func shaderModifier(named shaderModifierName: String) -> String {
        return try! String(contentsOfFile: Bundle.main.path(forResource: shaderModifierName, ofType: "shader")!, encoding: String.Encoding.utf8)
    }
}
