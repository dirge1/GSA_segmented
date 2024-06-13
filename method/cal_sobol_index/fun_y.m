function Y = fun_y(X,o,Tsum)
switch o
    case 1
        fx=X(:,1);
        fy=X(:,2);
        E=X(:,3);
        w=X(:,4);
        t=X(:,5);
        L=X(:,6);
        Y=4*L.^3./(E.*w.*t).*(((fx./w.^2).^2+(fy./t.^2).^2).^0.5);
        
    case 2
        x1=X(:,1);
        x2=X(:,2);
        x3=X(:,3);
        x4=X(:,4);
        for i=1:length(x1)
            if x1(i)/x2(i)>1.05
                Y(i,1)=x1(i)+x2(i)+0.8*x3(i)*x4(i);
            elseif x1(i)/x2(i)<0.95
                Y(i,1)=x1(i)+x2(i)+1.2*x3(i)*x4(i);
            else
                Y(i,1)=x1(i)+x2(i)+x3(i)*x4(i);
            end
        end
    case 3
        
        x1=X(:,1);
        x2=X(:,2);
        x3=X(:,3);
        x4=X(:,4);
        x5=normrnd(5,0.5,[length(x1),1]);
        for i=1:length(x1)
            if x5(i)<5.5
                Y(i,1)=x1(i)+x2(i)+0.5*x3(i)*x4(i);
            else
                Y(i,1)=x1(i)+x2(i)+2*x3(i)*x4(i);
            end
        end
    case 4
        P=X(:,1);
        TN=X(:,2);
        sy=X(:,3);
        d=X(:,4);
        l=X(:,5);
        Y=sy-16./(pi.*d.^3).*sqrt(4.*P.^2.*l.^2+3.*TN.^2);
    case 5
        x1=X(:,1);
        x2=X(:,2);
        x3=X(:,3);
        x4=normrnd(0,0.05,[length(x1),1]);
        Y=x1+x2+x3+x4;
    case 6
        x1=X(:,1);
        x2=X(:,2);
        x3=X(:,3);
        x4=X(:,4);
        Y=x1+x2+x1.*x2+x3.*x4;
    case 7
        x1=X(:,1);
        x2=X(:,2);
        Y=abs(x1+x2);
    case 8
        WD=X(:,1);
        RH=X(:,2);
        WS=X(:,3);
        FA=X(:,4);
        mc=2.76+0.124*RH-0.0187*WD;
        mf=18.53.*mc.^(-1.495);
        fhss=3.39*(1-exp(-0.03*FA*12));
        fhsns=2.5*(1-exp(-0.22*FA*12));
        hns=23.33*(1-exp(-0.025*FA*12));
        for i=1:length(WD)
            if WS(i)<5
                R(i,1)=30*mf(i);
            else
                R(i,1)=(30+1.531*(WS(i)-5)^0.858*fhss(i)^0.93*(fhsns(i)*hns(i))^0.637*1.03)*mf(i);
            end
        end
        Y=R;
    case 9
        ul=X(:,1);
        tl=X(:,2);
        te=X(:,3);
        ue=X(:,4);
        he=X(:,5);
        hl=X(:,6);
        %t=172;
        for i=1:length(ul)
            if t<tl(i)
                zl(i,1)=he(i)*exp(-1/2*((t-te(i))/ue(i))^2);
            else
                zl(i,1)=he(i)*exp(-1/2*((t-te(i))/ue(i))^2)+hl(i)*exp(-1/2*(log((t-tl(i))/ul(i)))^2);
            end
        end
        Y=zl;
    case 10
        x1=X(:,1);
        x2=X(:,2);
        %         for i=1:length(x1)
        %             if x1(i)<0.5
        %                 Y(i,1)=x1(i)+x2(i);
        %             else
        %                 Y(i,1)=x1(i)+1000*x2(i);
        %             end
        %         end
        Y=x1+1./x2;
    case 11
        Tsum1=X(:,1);
        Tsum2=X(:,2);
        Niu=X(:,3);
        Nil=X(:,4);
        %Tsum=1050;
        for i=1:length(Tsum1)
            if Tsum<Tsum1(i)
                Ni(i,1)=Niu(i);
            elseif Tsum>Tsum2(i)
                Ni(i,1)=Nil(i);
            else
                Ni(i,1)=Niu(i)*exp(log(Nil(i)/Niu(i))*(Tsum-Tsum1(i))/(Tsum2(i)-Tsum1(i)));
            end
        end
        Y=Ni;
    case 12
        ka=X(:,1);
        vin=X(:,2);
        vr=X(:,3);
        NP=10;
        %vt=14;
        for i=1:length(vr)
            if vr(i)>vt
                Y(i,1)=NP*ka(i)*(vt^3-vin(i)^3)/(vr(i)^3-vin(i)^3);
            else
                Y(i,1)=NP*ka(i);
            end
        end
    case 13
        x1=X(:,1);
        x2=X(:,2);
        for i=1:length(x1)
            if x1(i)<25
                Y(i,1)=x1(i)+0.5*x2(i);
            else
                Y(i,1)=25+0.5*x2(i);
            end
        end
    case 14
        ka=X(:,1);
        ec=X(:,2);
        cu=X(:,3);
        C=X(:,4);
        p=X(:,5);
        m=ka<0.4;
        n=ka>0.4;
        %     if ka<0.4
        ai(m)=0.1.*(1-(2.5671-2.2649./(ka(m).^0.054381)).^0.83.*(ec(m).*cu(m)./p(m)).^(1/3)).^(-9.3);
        %     else
        ai(n)=0.1.*(1-(2.5671-1.9987./(ka(n).^0.19087)).^0.83.*(ec(n).*cu(n)./p(n)).^(1/3)).^(-9.3);
        %     end
        Y=(C./p).^3.*ai';
        
        %             if ka(i)<0.4
        %                 Y(i,1)=0.1*(1-(1.5859-1.3993/(ka(i)^0.054381))*(ec(i)*cu(i)/p(i))^0.4)^(-9.185);
        %             else
        %                 Y(i,1)=0.1*(1-(1.5859-1.2348/(ka(i)^0.19087))*(ec(i)*cu(i)/p(i))^0.4)^(-9.185);
        %             end
        %         end
    case 15
        tfc=X(:,1);
        jfc=X(:,2);
        for i=1:length(tfc)
            if tfc(i)<312.5
                Y(i,1)=(3.3e-3-8.2e-5*(tfc(i)-273.15))*exp(8*jfc(i));
            else
                Y(i,1)=(1.1e-4-1.2e-6*(tfc(i)-273.15))*exp(8*jfc(i));
            end
        end
    case 16
        vs=X(:,1);
        va=X(:,2);
        nm=X(:,3);
        [delta_v,delta_v2]=fun_erosion(vs,va,nm);
        D=X(:,4);
        T1=D./delta_v;
        %         T1=vs./delta_v;
        if T1>Tsum
            Y=Tsum.*delta_v;
        else
            Y=T1.*delta_v+(Tsum-T1).*delta_v2;
        end
    case 17
        WD=X(:,1);
        RH=X(:,2);
        WS=X(:,3);
        FA=X(:,4);
        
        x2=[WD RH WS FA];
        input=x2;
        Y=krig_wind(input);
    case 18
        X1=X(:,1);
        X2=X(:,2);
        X3=X(:,3);
        X4=X(:,4);
        Y=X1.*X4+X3.*X4+X2+X3;
        
end

% E=X(:,1);
% t=X(:,2);
% a=X(:,3);
% r1=X(:,4);
% M=X(:,5);
% P=X(:,6);
% yi=0.41;
% lam=0.33;
% u=0.3;
% Y=1-sqrt(3.*(1-u.^2))./(pi.*E.*t.^2.*cos(a).^2).*(P./(2.*lam)+ M./(yi.*r1));

%Y=X(:,1).^2+X(:,2)+5*X(:,2).*X(:,3)+X(:,4).*X(:,3);
% Y=X(:,1)+X(:,2)+X(:,3);
%Y =  G_function(X,[0 1]);
%     Y= sum(X,2);
%     Y = X(:,1).*X(:,3)+X(:,2).*X(:,4);
%   Y=sin(X(:,1))+7*(sin(X(:,2))).^2+0.1*(X(:,3)).^4.*sin(X(:,1));
%  Y=sin(X(:,1))+7*(sin(X(:,2))).^2+(sin(X(:,3))).^2;
% Y= sum(X(:,1:2:end).*X(:,2:2:end),2);
%   Y= prod(X,2);
%   Y(sum(X,2)<1,:)=0;

end