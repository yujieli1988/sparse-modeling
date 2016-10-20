clear all
load ind.mat
%load Yall.mat
v = VideoReader('S07_Brownie_Video/S07_Brownie_7150991-1431.avi');
num_frames = v.Duration * v.FrameRate;
%num_frames = min(round(v.Duration * v.FrameRate), max_frames);
X = zeros(v.Height, v.Width, 3, num_frames, 'uint8');
vec = @(x) x(:);
scale = 1 / 4;
h = v.Height * scale;
w = v.Width * scale;
Y = zeros(h * w, num_frames);
f = 1;
while f <= num_frames && hasFrame(v)
  X(:, :, :, f) = readFrame(v);
 % Y(:, f) = vec(imresize(rgb2gray(im2double(X(:, :, :, f))), scale));
  f = f + 1;
end

%%
% alpha = 5;
% r = 30;
% verbose = true;

%[ind, C] = smrs(Y, alpha, r, verbose);

%%
[ind,B]=sort(ind,'ascend');
valid_ind = ind;%(sum(Y(:, ind)) > 0);
I = length(valid_ind);
H = h/scale;
W = w/scale;
tile = zeros(H, W * I, 3, class(X));
for i = 1:I
  tile(:, (1:W) + (i - 1) * W, :) = X(:, :, :, valid_ind(i));
end
 TT=tile(:,:,1);
 figure;
 image(tile)
% YY=zeros(H*W,I);
% for i=1:I
%     YY(:,i)=Y(:,valid_ind(i));
% end


