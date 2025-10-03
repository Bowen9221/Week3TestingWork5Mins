using NUnit.Framework;
using System.Collections.Generic;
using UnityEngine;

public class TexChangers : MonoBehaviour
{

    [SerializeField] GameObject Model;
    public List<Material> materials = new List<Material>();
    Renderer modelRenderer;

    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Start()
    {
        modelRenderer = GetComponent<Renderer>();

        modelRenderer.material = materials[0];
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Space))
        {

            int randomIndex = Random.Range(0, materials.Count);
            modelRenderer.material = materials[randomIndex];

        }
    }
}
