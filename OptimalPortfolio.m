function OptimalPortfolio()
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
tic
% load portfolio data
load('-mat','C:\Users\xiaoquan007\Documents\MATLAB\data.mat');
% importfile(inFile);

% Creat a Portfolio Object
p = Portfolio('AssetList', AssetList, 'RiskFreeRate', CashMean);
p = p.setAssetMoments(AssetMean, AssetCovar);
p = p.setInitPort(1/p.NumAssets);

p = p.setDefaultConstraints;
awgt = p.estimateFrontierByReturn(TargetReturn/12);
[~, ~] = p.estimatePortMoments(awgt);

aBlotter = dataset({100*awgt(awgt > 0),'Weight'}, 'obsnames', p.AssetList(awgt > 0));
disp(aBlotter);

%
outFile = 'result.dat';
csvwrite(outFile,awgt);
toc
end

