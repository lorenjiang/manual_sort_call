function [ax,fig] = make_plots(y,t,fs,file) %makes amplitude envelope and spectrogram for given .wav file
    
    
    figure('name',file,'units','normalized','outerposition',[0 0 1 1]); h = subplot(2,1,1); plot(t,y); title('Amplitude vs. Time'); xlabel('Time (seconds)'); ylabel('Amplitude');
    h.XTick = [0:0.25:length(t)];
    ax = gca;
    g_noise=0.00001*randn(size(y)); %gaussian noise used to calculate threshold value
    thresh=-snr(y,g_noise)-20; %threshold value for spetrogram
    g = subplot(2,1,2); spectrogram(y,256,[],[],fs,'power','minthreshold',thresh,'yaxis'); title('Spectrogram'); g.XTick = [0:0.25:length(t)];
    %set(gcf,'Position',[0 0 2000 1000]); 
    colormap('jet'); 
    fig = gcf;
end