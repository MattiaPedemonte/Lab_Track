data = readtable("S013_2DLC_resnet50_P_vista_frontaleJul26shuffle1_550000__filtered.csv");
x = data(:,7);

x_elbow_r=table2array(data(:,7));
x_elbow_l=table2array(data(:,9));

y_elbow_r=table2array(data(:,8));
y_elbow_l=table2array(data(:,10));

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

minimi=islocalmin(y_elbow_r);
valori_minimi=y_elbow_r(minimi);
posizioni_minimi = find(minimi);

figure(1)
plot(y_elbow_r)
hold on
plot(posizioni_minimi, valori_minimi, 'ro')


% for i=1:length(valori_minimi)
%     if(valori_minimi(i) < mean(valori_minimi))
%         pks(i)=valori_minimi(i);
%         posizioni(i)=i;
%     end
% end

pks=valori_minimi(valori_minimi < mean(valori_minimi));
posizioni_pks=posizioni_minimi(valori_minimi < mean(valori_minimi));

figure(2)
plot(y_elbow_r)
hold on
plot(posizioni_pks, pks, 'ro')

for i=1:(length(pks)-1)
    pks_distances(i)=pks(i+1)-pks(i);
end

conteggio=0;
mean_pks=mean(pks_distances);
for i=1:length(posizioni_pks)-1
    if abs(pks_distances(i)) > 10
       cambio_movimento = i; 
       conteggio=conteggio+1;
       istante_temporale = posizioni_pks(i);
       disp(['Fine del movimento ' num2str(conteggio) ' :istante temporale: ' num2str(istante_temporale)])
       
    end
end
    




