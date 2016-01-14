function id = src_without(y, p_number, train_number, img_width, img_height)
img_size = img_width*img_height; 
A = zeros(img_size,train_number*p_number);%求出图像排成列向量后的大小。即列向量的维数
for i = 1:p_number
    for j = 1:train_number
        s = sprintf('CroppedYale-jpg-order/yaleB%d/%d.jpg', i, j+1);
        temp_im = imread(s);
        A(:,j+(i-1)*train_number) = temp_im(:);
    end
end   
disp('break point a')
Afun = @(z) A*z;
Atfun = @(z) A'*z;
x0 = A'*y;
xp = l1eq_pd(x0, Afun, Atfun, y, 1e-3, 30, 1e-8, 200);
r = judge(y, A, xp, p_number, train_number);
id = find(r == min(r))
    

end
