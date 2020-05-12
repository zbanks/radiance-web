#property description Distort the screen to the beat

void main(void) {
    vec3 noise_input = vec3(uv, iTime * 0.3);
    vec2 shift = (vec2(noise(noise_input), noise(noise_input + 100.)) - 0.5);
    shift += (vec2(noise(2. * noise_input), noise(2. * noise_input + 100.)) - 0.5) * 0.5;
    shift += (vec2(noise(4. * noise_input), noise(4. * noise_input + 100.)) - 0.5) * 0.25;
    shift = 0.3 * shift;
    shift /= aspectCorrection;

    fragColor = texture(iInput, uv + shift * iIntensity * (15. * iAudioLevel) * sawtooth(iTime, 0.1));
}
