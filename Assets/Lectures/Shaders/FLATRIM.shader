Shader "URP/FlatShadingURP"
{
    Properties
    {
        _BaseColor ("Base Color", Color) = (1, 1, 1, 1)   // Base color of the object
        _RimColor ("Rim Color", Color) = (0, 0.5, 0.5, 1)
        _RimPower ("Rim Power", Range(0.5, 8.0)) = 3.0
    }

    SubShader
    {
        Tags { "RenderPipeline" = "UniversalRenderPipeline" "RenderType" = "Opaque" }
        LOD 800 
        Pass
        {
            HLSLPROGRAM


            #pragma vertex vert
            #pragma fragment frag

            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"

            struct Attributes
            {
                float4 positionOS : POSITION;  // Object space position
                float3 normalOS : NORMAL;      // Object space normal
                float4 tangentOS : TANGENT;
            };

            struct Varyings
            {
                float4 positionHCS : SV_POSITION; // Homogeneous clip-space position
                float3 posWS : TEXCOORD0;         // World space position
                float3 viewDirWS : TEXCOORD1;
                float3 normalWS : TEXCOORD2;      // Interpolated world space normal (for lighting)
            };

            CBUFFER_START(UnityPerMaterial) // Continuously runs this buffer (I'm assuming that it makes the color run each frame, but I'm not sure)
                float4 _BaseColor;   // Base color property
                float4 _RimColor;
                float _RimPower;
            CBUFFER_END

            // Vertex Shader
            Varyings vert(Attributes IN)
            {
                Varyings OUT;
                OUT.posWS = TransformObjectToWorld(IN.positionOS.xyz);
                // Transform object space position to homogeneous clip-space
                OUT.positionHCS = TransformObjectToHClip(IN.positionOS.xyz);
                // Pass the world space normal (we'll recompute it in the fragment shader)
                OUT.normalWS = normalize(TransformObjectToWorldNormal(IN.normalOS));
                float3 worldPosWS = TransformObjectToWorld(IN.positionOS.xyz);
                OUT.viewDirWS = normalize(GetCameraPositionWS() - worldPosWS);
                return OUT;
            }

            // Fragment Shader
            half4 frag(Varyings IN) : SV_Target
            {
                // Recalculate face normal using the pixel derivatives in world space (Lowpoly effect)
                float3 edge1 = ddx(IN.posWS);
                float3 edge2 = ddy(IN.posWS);
                half3 faceNormalWS = normalize(cross(edge1, edge2));

                half3 normalWS = normalize(IN.normalWS);
                half3 viewDirWS = normalize(IN.viewDirWS);

                half rimFactor = 1.0 - saturate(dot(viewDirWS, normalWS));
                half rimLighting = pow(rimFactor, _RimPower);

                // Fetch the main light in URP
                Light mainLight = GetMainLight();
                half3 lightDir = normalize(mainLight.direction);

                // Invert the dot product for proper lighting
                half NdotL = saturate(dot(faceNormalWS, -lightDir)); // Inverted light direction

                // Multiply base color by the diffuse lighting term (NdotL)
                half3 finalColor = _BaseColor.rgb * NdotL + rimLighting * _RimColor.rgb;

                return half4(finalColor, _BaseColor.a);
            }

            ENDHLSL
        }
    }
}