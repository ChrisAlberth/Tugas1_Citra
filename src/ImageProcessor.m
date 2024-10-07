classdef ImageProcessor
    methods
        function histogram = calculateGrayscaledHistogram(~, image)
            [row, col] = size(image);
            histogram = zeros(1, 256);
    
            for i = 1:row
                for j = 1:col
                    intensity = image(i, j);
                    histogram(intensity + 1) = histogram(intensity + 1) + 1;
                end
            end
        end
        function histogram = calculateColoredHistogram(image)
            [row, col, channel] = size(image);
            histogram = zeros(3, 256);
    
            for c = 1:channel
                for i = 1:row
                    for j = 1:col
                        intensity = image(i, j, c); 
                        histogram(c, intensity + 1) = histogram(c, intensity + 1) + 1;
                    end
                end
            end
        end
    end
end