function DrawPath(array,path)
    n=length(path);
    col=zeros(1,n);
    row=zeros(1,n);
    for i=1:n
       [col(i),row(i)]=find(array==path(i));      
    end
    plot(row+0.5,col+0.5,'y-o ');
end
