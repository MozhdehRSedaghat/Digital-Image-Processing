% Demo for Structured Edge Detector (please see readme.txt first).

%% set opts for training (see edgesTrain.m)
opts=edgesTrain();                % default options (good settings)
opts.modelDir='models/';          % model will be in models/forest
opts.modelFnm='modelBsds';        % model name
opts.nPos=5e5; opts.nNeg=5e5;     % decrease to speedup training
opts.useParfor=0;                 % parallelize if sufficient memory

%% train edge detector (~20m/8Gb per tree, proportional to nPos/nNeg)
tic, model=edgesTrain(opts); toc; % will load model if already trained

%% set detection parameters (can set after training)
model.opts.multiscale=0;          % for top accuracy set multiscale=1
model.opts.sharpen=2;             % for top speed set sharpen=0
model.opts.nTreesEval=4;          % for top speed set nTreesEval=1
model.opts.nThreads=4;            % max number threads for evaluation
model.opts.nms=0;                 % set to true to enable nms

%% evaluate edge detector on BSDS500 (see edgesEval.m)
if(0), edgesEval( model, 'show',1, 'name','' ); end

%% detect edge and visualize results
I1 = imread('Pig.jpg');
I2=imread('Tiger.jpg');
tic, E1=edgesDetect(I1,model); toc
tic, E2=edgesDetect(I2,model); toc
figure(1); im(I1); figure(2); im(I2);
figure(3); imshow(1-E1);title("without multi-scale")
figure(4); imshow(1-E2);title("without multi-scale")
%% set detection parameters (can set after training)
model.opts.multiscale=1;          % for top accuracy set multiscale=1
model.opts.sharpen=2;             % for top speed set sharpen=0
model.opts.nTreesEval=4;          % for top speed set nTreesEval=1
model.opts.nThreads=4;            % max number threads for evaluation
model.opts.nms=0;                 % set to true to enable nms
%% detect edge and visualize results
tic, E1=edgesDetect(I1,model); toc
tic, E2=edgesDetect(I2,model); toc
figure(5); im(1-E1);title("with multi-scale");imwrite(1-E1,'1multi.png')
figure(6); im(1-E2);title("with multi-scale");imwrite(1-E2,'2multi.png')
%% set detection parameters (can set after training)
model.opts.multiscale=0;          % for top accuracy set multiscale=1
model.opts.sharpen=0;             % for top speed set sharpen=0
model.opts.nTreesEval=4;          % for top speed set nTreesEval=1
model.opts.nThreads=4;            % max number threads for evaluation
model.opts.nms=0;                 % set to true to enable nms
%% detect edge and visualize results
tic, E1=edgesDetect(I1,model); toc
tic, E2=edgesDetect(I2,model); toc
figure(7); im(1-E1);title("sharpen=0");imwrite(1-E1,'1sharpen0.png')
figure(8); im(1-E2);title("sharpen=0");imwrite(1-E2,'2sharpen0.png')
%% set detection parameters (can set after training)
model.opts.multiscale=0;          % for top accuracy set multiscale=1
model.opts.sharpen=1;             % for top speed set sharpen=0
model.opts.nTreesEval=4;          % for top speed set nTreesEval=1
model.opts.nThreads=4;            % max number threads for evaluation
model.opts.nms=0;                 % set to true to enable nms
%% detect edge and visualize results
tic, E1=edgesDetect(I1,model); toc
tic, E2=edgesDetect(I2,model); toc
figure(9); im(1-E1);title("sharpen=1");imwrite(1-E1,'1sharpen1.png')
figure(10); im(1-E2);title("sharpen=1");imwrite(1-E2,'2sharpen1.png')
%% set detection parameters (can set after training)
model.opts.multiscale=0;          % for top accuracy set multiscale=1
model.opts.sharpen=2;             % for top speed set sharpen=0
model.opts.nTreesEval=4;          % for top speed set nTreesEval=1
model.opts.nThreads=4;            % max number threads for evaluation
model.opts.nms=0;                 % set to true to enable nms
%% detect edge and visualize results
tic, E1=edgesDetect(I1,model); toc
tic, E2=edgesDetect(I2,model); toc
figure(11); im(1-E1);title("sharpen=2");imwrite(1-E1,'1sharpen2.png')
figure(12); im(1-E2);title("sharpen=2");imwrite(1-E2,'2sharpen2.png')
%% set detection parameters (can set after training)
model.opts.multiscale=0;          % for top accuracy set multiscale=1
model.opts.sharpen=2;             % for top speed set sharpen=0
model.opts.nTreesEval=1;          % for top speed set nTreesEval=1
model.opts.nThreads=4;            % max number threads for evaluation
model.opts.nms=0;                 % set to true to enable nms
%% detect edge and visualize results
tic, E1=edgesDetect(I1,model); toc
tic, E2=edgesDetect(I2,model); toc
figure(13); im(1-E1);title("nTreesEval=1");imwrite(1-E1,'1nTreesEval1.png')
figure(14); im(1-E2);title("nTreesEval=1");imwrite(1-E2,'2nTreesEval1.png')

%% set detection parameters (can set after training)
model.opts.multiscale=0;          % for top accuracy set multiscale=1
model.opts.sharpen=2;             % for top speed set sharpen=0
model.opts.nTreesEval=4;          % for top speed set nTreesEval=1
model.opts.nThreads=4;            % max number threads for evaluation
model.opts.nms=0;                 % set to true to enable nms
%% detect edge and visualize results
tic, E1=edgesDetect(I1,model); toc
tic, E2=edgesDetect(I2,model); toc
figure(17); im(1-E1);title("nTreesEval=4");imwrite(1-E1,'1nTreesEval4.png')
figure(18); im(1-E2);title("nTreesEval=4");imwrite(1-E2,'2nTreesEval4.png')
%% set detection parameters (can set after training)
model.opts.multiscale=0;          % for top accuracy set multiscale=1
model.opts.sharpen=2;             % for top speed set sharpen=0
model.opts.nTreesEval=4;          % for top speed set nTreesEval=1
model.opts.nThreads=1;            % max number threads for evaluation
model.opts.nms=0;                 % set to true to enable nms
%% detect edge and visualize results
tic, E1=edgesDetect(I1,model); toc
tic, E2=edgesDetect(I2,model); toc
figure(19); im(1-E1);title("nThreads=1");imwrite(1-E1,'1nThreads1.png')
figure(20); im(1-E2);title("nThreads=1");imwrite(1-E2,'2nThreads1.png')
%% set detection parameters (can set after training)
model.opts.multiscale=0;          % for top accuracy set multiscale=1
model.opts.sharpen=2;             % for top speed set sharpen=0
model.opts.nTreesEval=4;          % for top speed set nTreesEval=1
model.opts.nThreads=4;            % max number threads for evaluation
model.opts.nms=0;                 % set to true to enable nms
%% detect edge and visualize results
tic, E1=edgesDetect(I1,model); toc
tic, E2=edgesDetect(I2,model); toc
figure(21); im(1-E1);title("nThreads=4");imwrite(1-E1,'1nThreads4.png')
figure(22); im(1-E2);title("nThreads=4");imwrite(1-E2,'2nThreads4.png')
%% set detection parameters (can set after training)
model.opts.multiscale=1;          % for top accuracy set multiscale=1
model.opts.sharpen=2;             % for top speed set sharpen=0
model.opts.nTreesEval=4;          % for top speed set nTreesEval=1
model.opts.nThreads=4;            % max number threads for evaluation
model.opts.nms=0;                 % set to true to enable nms
%% detect edge and visualize results
tic, E1=edgesDetect(I1,model); toc
tic, E2=edgesDetect(I2,model); toc
figure(23); im(1-E1);title("nms=0");imwrite(1-E1,'1nms0.png')
figure(24); im(1-E2);title("nms=0");imwrite(1-E2,'2nms0.png')
%% set detection parameters (can set after training)
model.opts.multiscale=1;          % for top accuracy set multiscale=1
model.opts.sharpen=2;             % for top speed set sharpen=0
model.opts.nTreesEval=4;          % for top speed set nTreesEval=1
model.opts.nThreads=4;            % max number threads for evaluation
model.opts.nms=1;                 % set to true to enable nms
%% detect edge and visualize results
tic, E1=edgesDetect(I1,model); toc
tic, E2=edgesDetect(I2,model); toc
figure(25); im(1-E1);title("nms=1");imwrite(1-E1,'1nms1.png')
figure(26); im(1-E2);title("nms=1");imwrite(1-E2,'2nms1.png')
