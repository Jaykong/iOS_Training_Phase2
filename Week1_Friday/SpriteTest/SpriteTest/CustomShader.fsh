//Fragment SHader（片段着色器）

//void main() {
//    vec4 color = SKDefaultShading();
//    color = vec4(1.0,0.0,0.0,color.a);
//    color.rgb *= color.a;
//    gl_FragColor = color;
//}

void main() {
    //获取像素原颜色
    vec4 color = SKDefaultShading();
    //获取噪声着色器的对应点
    vec4 noiseSample = texture2D(noiseTexture,v_tex_coord);
    //低于阀值，则设定alpha为零
    if (noiseSample.a < threshold) {
        color.a = 0.0;
    }
    //色彩通道(rgb)与alpha通道相乘
    color.rgb *= color.a;
    
    
    gl_FragColor = color;
}


//// BEGIN noise_shader_impl
//void main()
//{
//    // Get the original color for this pixel
//    vec4 color = SKDefaultShading();
//    
//    // Get the corresponding point in the noise shader
//    vec4 noiseSample = texture2D(noiseTexture, v_tex_coord);
//    
//    // If the noise value is below the threshold,
//    // then set the alpha value to 0
//    if (noiseSample.a < threshold) {
//        color.a = 0.0;
//    }
//    
//    // Premultiply the color channels (red, green, and blue)
//    // with the alpha channel
//    color.rgb *= color.a;
//    
//    // Return the finished color
//    gl_FragColor = color;
//}
//// END noise_shader_impl