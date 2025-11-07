# Week3TestingWork5Mins

Lecture 9


vertex fragment shader.
    - I don't at all understand what this shader is meant to do, the description isn't very helpful to me. To me it seems like it is meant to add texture to the game objects, however, I'm not sure that I understand how it is meant to happen. The slides make it seem like its meant to be either in or behind the gameobject, but even then nothing of interest really happens. To me it just seems like a glorified Tiling and Offset. Perhaps you can shed some light on that for me?
    ![In Front of the wolf](<Screenshot 2025-11-07 152851.png>)
    ![Behind The Wolf](<Screenshot 2025-11-07 152906.png>)

Simple Lighting Shadow
    - This shader seems to be what the default "Lit" shader is as it returns a blank color material with a shadow being reflected by the main light source, something I will note is that there is no penumbra within the shaders which could be a result of having a directional light and not an area light, or it could be because the shader is simplified to not take the penumbra into account.
    ![Gif of the wolf with a shadow (Added the default texture for the model as another "Pass")](<Shadow Wolf.gif>)

Simple Shadow With Texture.
    - This one also confused me. Its displaying a shadow that is seemingly accurate to the light source, however where the light should be hitting spot on is covered in the shadow lighting which is the exact opposite of what should be happening. I tried one minus'ing certain parts of the code, but it always broke the code and I'm not sure how to fix it, so this is what I'm stuck with.
    ![Broken Shadow With Texture](<Screenshot 2025-11-07 154431.png>)

Glass
    - The Glass shader also did not work well for me, there was no transparency regardless of what the code said. I played around with the bump extrusion, the Fresnel intensity, the Tint intensity, still nothing happened. It's also the only shader on the object so I don't personally see why it isn't working.
    ![Not Working Glass Effect](<Screenshot 2025-11-07 160112.png>)

Water
    - The water is a cool effect, especially if you can affect the bumps within the center of the texture for some randomness, however in order to do that you would have to generate randomized noise and create the bump mapping based on that.
    ![Wave Effect Gif](<Water Ripple.gif>)

Water Scrolling
    - I tried to modify the scripts a bit to first off slow down the water scrolling from a raging tide to a calm ocean speed. Another thing I tried was adding the water wave shader underneath this shader, however it was just overlaying so I would have to make it within the shader itself as another pass.
    ![Water Ripple as well as Water Scroll](<Water Move.gif>)