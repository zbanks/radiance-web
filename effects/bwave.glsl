#property description Black sine wave from left to right.

void main(void) {
    vec2 normCoord = (uv - 0.5) * aspectCorrection;
    float x = (normCoord.x + normCoord.y) * 15. + iTime;
    fragColor = texture(iInput, uv);
    fragColor *= 1.0 - iIntensity * (0.5 * sin(x) + 0.5);
}
