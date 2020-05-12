#property description Only update a vertical slice that slides across

void main(void) {
    vec4 prev = texture(iChannel[0], uv);
    vec4 next = texture(iInput, uv);
    float factor = pow(iIntensity, 2.0);

    float t = mod(iTime / 4.0 - uv.x, 1.0);
    float x = 0.0;
    if (t < 0.5) x = pow(0.5 - t, 3.0);

    factor = min(factor, 1.0 - x);
    factor = clamp(factor, 0.0, 1.0);

    fragColor = mix(next, prev, factor);
}
