%function takes number of bins as parameter
function image_hist(bins)
img = imread('kierowca.png');
o = rgb2gray(img);
[M,N]=size(o);
max_value = 256;
bins_width = max_value / bins

% vector t returns number of occurencies of every value from the image, i.e. t(0) = 4 - zero occured four times in the image
t=1:256;
count=0;
for k=1:256
    for i=1:M
        for j=1:N  
            if o(i,j)==k-1      %matlab first index is 1, so k-1 to get "0"
                count=count+1;
            end
        end
    end
            t(k)=count;
            count=0;
end

vt = t(:);
temp = 0;

%loop distributes values from vector t to newly counted bins
for i = 1:bins
    for j = i * floor(bins_width) : (i+1) * floor(bins_width)   % bins widths
        temp = temp + vt(j)
    end
    arr(i) = temp
    temp = 0;
end

arr
plot(arr);
grid on;
xlabel('bins');
ylabel('no of occurrences');
