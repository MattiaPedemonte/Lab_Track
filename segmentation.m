S001_front = readtable("S001_1DLC_resnet50_P_vista_frontaleJul26shuffle1_550000__filtered.csv");
S004_front = readtable("S004_2DLC_resnet50_P_vista_frontaleJul26shuffle1_550000__filtered.csv");
S008_front = readtable("S008_1DLC_resnet50_P_vista_frontaleJul26shuffle1_550000__filtered.csv");
S011_front = readtable("S011_2DLC_resnet50_P_vista_frontaleJul26shuffle1_550000__filtered.csv");
S013_front = readtable("S013_2DLC_resnet50_P_vista_frontaleJul26shuffle1_550000__filtered.csv");

shoulder0_r_y01 = table2array(S001_front(:,4)) - mean(table2array(S001_front(:,4)));
altezza_shoulder_r_y01 = mean(abs(shoulder0_r_y01));

elbow0_r_y01= table2array(S001_front(:,8));
valori_minimi=elbow0_r_y01(minimi);
posizioni_minimi = find(minimi);

figure(1)
plot(elbow0_r_y01)
hold on
plot(posizioni_minimi, valori_minimi, 'ro')


for i=1:length(valori_minimi)
    if(valori_minimi(i) < (-altezza_shoulder_r_y01))
        pks(i)=valori_minimi(i);
        posizioni(i)=i;
    end
end

pks=valori_minimi(valori_minimi < (-altezza_shoulder_r_y01));
posizioni_pks=posizioni_minimi(valori_minimi < (-altezza_shoulder_r_y01));

figure(2)
plot(elbow0_r_y01)
hold on
plot(posizioni_pks, pks, 'ro')
%% 

[pks, locations] = findpeaks(table2array(S001_front(:,8)));
figure(3)
plot(table2array(S001_front(:,8)))
hold on 
plot(locations, pks, 'ro')
%% 


% shoulder_r_y01 = table2array(S001_front(:,4));
% shoulder0_r_y01 = shoulder_r_y01-(mean(shoulder_r_y01));
% 
% altezza_spalla01= mean(abs(shoulder0_r_y01));

% figure(1)
% plot(shoulder0_r_y01)
% hold on
% plot(meanshoulder_r_y01, 'ro')
% 
% figure(2)
% plot( table2array(S001_front(:,8)) - mean(table2array(S001_front(:,8))) )
% shoulder_r_y04 = table2array(S004_front(:,4));
% shoulder_r_y08 = table2array(S001_front(:,4));

% x = S013_front(:,7);
% 
% x_elbow_r=table2array(S013_front(:,7));
% x_elbow_l=table2array(S013_front(:,9));
% 
% y_elbow_r=table2array(S013_front(:,8));
% y_elbow_l=table2array(S013_front(:,10));

% figure(1)
% plot(x_elbow_r)
% hold on
% plot(x_elbow_l)
% 
% figure(2)
% plot(y_elbow_r)
% hold on
% plot(y_elbow_l)

% [pks,locs] = findpeaks(-y_elbow_r);
% minimi=-pks;
% % scatter(locs,minimi)
% 
% figure
% plot(y_elbow_r)
% hold on
% plot(locs, minimi, 'ro')

% minimi=islocalmin(y_elbow_r);
% valori_minimi=y_elbow_r(minimi);
% posizioni_minimi = find(minimi);
% 
% figure(1)
% plot(y_elbow_r)
% hold on
% plot(posizioni_minimi, valori_minimi, 'ro')


% for i=1:length(valori_minimi)
%     if(valori_minimi(i) < mean(valori_minimi))
%         pks(i)=valori_minimi(i);
%         posizioni(i)=i;
%     end
% end
% 
% pks=valori_minimi(valori_minimi < mean(valori_minimi));
% posizioni_pks=posizioni_minimi(valori_minimi < mean(valori_minimi));
% 
% figure(2)
% plot(y_elbow_r)
% hold on
% plot(posizioni_pks, pks, 'ro')
% 
% for i=1:(length(pks)-1)
%     pks_distances(i)=pks(i+1)-pks(i);
% end
% 
% conteggio=0;
% mean_pks=mean(pks_distances);
% for i=1:length(posizioni_pks)-1
%     if abs(pks_distances(i)) > 10
%        cambio_movimento = i; 
%        conteggio=conteggio+1;
%        istante_temporale = posizioni_pks(i);
%        disp(['Fine del movimento ' num2str(conteggio) ' :istante temporale: ' num2str(istante_temporale)])
%        
%     end
% end
%     
%% 

fc = 5;
fs = 30;

[b,a] = butter(12,fc/(fs/2));
elb = table2array(S001_front(:,8));
dataOut = filter(b,a,elb);
figure(2)
plot(dataOut)


