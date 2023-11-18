// Define parameters
Fs = 1000; // Sampling frequency (1 kHz)
T = 1;	// Duration of the signal (1 second) 
t = 0:1/Fs:T-1/Fs; // Time vector

// Generate a basic alpha wave EEG signal 
alpha_frequency = 10; // Alpha wave frequency (in Hz) 
alpha_amplitude = 50; // Alpha wave amplitude
eeg_signal = alpha_amplitude * sin(2 * %pi * alpha_frequency * t);

// Add random noise to the EEG signal 
noise_amplitude = 10; // Amplitude of noise
eeg_with_noise = eeg_signal + noise_amplitude * rand(1, length(t)) - noise_amplitude/2;

// Plot the EEG signal with noise 
subplot(2,1,1);
plot(t, eeg_with_noise, 'b');
title('EEG Signal with Noise'); 
xlabel('Time (s)'); 
ylabel('Amplitude');

// Frequency analysis
N = length(eeg_with_noise);
frequencies = Fs * (0:N/2-1) / N; 
fft_result = fft(eeg_with_noise);
magnitude = 2 * abs(fft_result(1:N/2)) / N;

// Plot the frequency components subplot(2,1,2);
 
plot(frequencies, magnitude, 'r'); 
title('Frequency Components of EEG Signal'); 
xlabel('Frequency (Hz)');
ylabel('Magnitude');

