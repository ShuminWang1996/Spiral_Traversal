function [path,record,path_long]=main()
   clear all
   a=load("test.txt");
   n=size(a,1);
   b=a;
   b(end+1,end+1)=1;
   figure(1)
   colormap([1 1 1;0 1 1]);
   pcolor(b);
   set(gca,'XTick',10:10:n,'YTick',10:10:n); 
   axis image xy
   array=reshape(1:n*n,n,n);
   array=array';
%    array=array(end:-1:1,:);
   for i=1:n*n
       [col,row]=find(array==i);
       text(row+0.2,col+0.5,num2str(i));
   end
   [path,record]=SP(array,a);
   record1=record;
   record1(end+1,end+1)=1;
   figure(2);
   colormap([0 0 0;1 0 0;0 1 0;0 0 1;1 1 0;1 0 1]);
   pcolor(record1);
   hold on
   set(gca,'XTick',10:10:n,'YTick',10:10:n); 
   axis image xy
   DrawPath(array,path);
   path_long=0;
   for i=1:length(path)-1
       path_long=path_long+distance(array,path(i),path(i+1));
   end
end
