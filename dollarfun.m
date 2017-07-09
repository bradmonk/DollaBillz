clc; close all; clear

nPeople = 500;
nDollars = 100;
nIters = 10000;

Dollars = ones(nPeople,1) * nDollars;

fh1=figure('Units','normalized','OuterPosition',[.1 .1 .8 .6],'Color','w','MenuBar','none');
hax1 = axes('Position',[.05 .05 .9 .9],'Color','none','XTick',[],'YTick',[]);
ph1 = bar(Dollars); hax1.XLim = [0 nPeople+1]; hax1.YLim = [0 nDollars*5]; hold on

for t = 1:nIters

    GiveTo = randi(nPeople,nPeople,1);
    
    CanGive = Dollars > 0;

    GetD = GiveTo .* CanGive;

    for i = 1:nPeople
        if CanGive(i) > 0
            Dollars(GetD(i)) = Dollars(GetD(i)) + 1;
            Dollars(i) = Dollars(i) - 1;
        end
    end

    ph1.YData = sort(Dollars); pause(.005);
end

close all
distributionFitter(sort(Dollars))

