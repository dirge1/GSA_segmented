function result=bi_mutual_information(x,y)
x=ctransform(x);
y=ctransform(y);

pycal=py.mutual_information_cal.Bimutual(x,y);
tp=pycal.bimu();

if (tp<0)
    result=0;
else
    result=tp;
end