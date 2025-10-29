% Exercise 11: FIR Filter Types (I–IV)
% Author: Rupashri Das
% Date: 

close all; clear; clc;

% --------------------------------------------------------
% Impulse responses (given in the exercise)
% --------------------------------------------------------
h1 = [1 2 3 4 4 3 2 1];     % FIR Type I  (M even, symmetric)
h2 = [1 2 3 4 3 2 1];       % FIR Type II (M odd, symmetric)
h3 = [-1 -2 -3 -4 3 3 2 1]; % FIR Type III (M even, antisymmetric)
h4 = [-1 -2 -3 0 3 2 1];    % FIR Type IV (M odd, antisymmetric)

filters = {h1, h2, h3, h4};
labels = {'FIR1 (Type I)', 'FIR2 (Type II)', 'FIR3 (Type III)', 'FIR4 (Type IV)'};

% --------------------------------------------------------
% Plot all four filters
% --------------------------------------------------------
figure('Units','normalized','Position',[0.05 0.05 0.9 0.8], 'Color','w');

for k = 1:4
    h = filters{k};
    [H, w] = freqz(h, 1, 512);  % frequency response

    % Magnitude response
    subplot(4,3,(k-1)*3 + 1);
    plot(w/pi, abs(H), 'LineWidth', 1.3);
    grid on;
    xlabel('Frequency (\omega / \pi)');
    ylabel('|H|');
    title([labels{k} ' - Magnitude']);

    % Phase response (unwrapped)
    subplot(4,3,(k-1)*3 + 2);
    plot(w/pi, unwrap(angle(H)), 'LineWidth', 1.3);
    grid on;
    xlabel('Frequency (\omega / \pi)');
    ylabel('Phase (radians)');
    title([labels{k} ' - Phase']);

    % Pole-Zero diagram
    subplot(4,3,(k-1)*3 + 3);
    zplane(h, 1);
    title([labels{k} ' - Zeros']);
    axis equal;
end

sgtitle('Exercise 11 – Results (FIR Filter Types I–IV)');
set(gcf, 'Color', 'w');

% --------------------------------------------------------
% Save figure
% --------------------------------------------------------
saveas(gcf, 'exercise11_results.png');
disp('Figure saved as exercise11_results.png');