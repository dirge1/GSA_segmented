function result=Borgonovo_measure(z,y)
pycal=py.delta_measure.Bo(z,y);
tp=pycal.bo();
result=double(tp);
end