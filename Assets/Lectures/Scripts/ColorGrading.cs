using UnityEngine;
using System.Collections.Generic;
using System.Collections;

public class ColorGrading : MonoBehaviour
{

    public Shader colorGradingShader = null;
    public Material m_renderMaterial;

    void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        Graphics.Blit(source, destination, m_renderMaterial);
    }
}
