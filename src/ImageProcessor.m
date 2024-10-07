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

        function histogram = calculateColoredHistogram(~, image)
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

        function result = imageBrightening(~, image, a, b)
            result = a * image + b;
        end

        function result = imageNegative(~, image)
            result = 255 - image;
        end

        function result = imageNegativeInversed(~, image)
            result = 255 - (255 - image);
        end

        function result = logTransformation(~, image, c)
            result = im2double(image);
            [row,col]=size(result);

            for i=1:row
                for j=1:col
                    result(i,j)= c*log(result(i,j) + 1);
                end
            end
        end
    end
end