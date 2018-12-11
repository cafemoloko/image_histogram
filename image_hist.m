function image_hist(bins)
img = imread('kierowca.png');
o = rgb2gray(img);
[M,N]=size(o);
min_value = 0;
max_value = 265;
bins_width = max_value / bins                        %szerokoœæ przedzia³ów
bin_intervals = [min_value:bins_width:max_value]     %nowe zakresy przedzia³ów

t=1:256;
count=0;
for k=1:256
    for i=1:M
        for j=1:N  
            if o(i,j)==k-1
                count=count+1;
            end
        end
    end
            t(k)=count;
            count=0;
end

vt = t(:);
temp = 0;

for i = 1:bins
    for j = i * floor(bins_width) : (i+1) * floor(bins_width) 
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