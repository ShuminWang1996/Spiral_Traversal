function [path,record]=SP(array,a)
  [m,n]=size(array);
  begin_x=1;
  begin_y=1;
  end_x=n;
  end_y=m;
  path=[];
  record=zeros(m,n);
  while 1
  for i=begin_x:end_x
      if a(i,begin_y)==1
          j=1;
          while(a(i,begin_y+j)==1)
              path=[path array(i-1,begin_y+j)];
              record(i-1,begin_y+j)=record(i-1,begin_y+j)+1;
              j=j+1;
          end
          path=[path array(i,begin_y+j)];
          record(i+1,begin_y+j)=record(i+1,begin_y+j)+1;
          if j>1
             for s=1:j-1
                path=[path array(i+1,begin_y+j-s)];   
                record(i+1,begin_y+j-s)=record(i+1,begin_y+j-s)+1;
             end
          end
      else
          path=[path array(i,begin_y)];
          record(i,begin_y)=record(i,begin_y)+1;
      end
  end
  begin_y=begin_y+1;
  if begin_y>end_y
      break
  end
  for i=begin_y:end_y
          if a(end_x,i)==1
          j=1;
          while(a(end_x-j,i)==1)
              path=[path array(end_x-j,i-1)];
              record(end_x-j,i-1)=record(end_x-j,i-1)+1;
              j=j+1;
          end
          path=[path array(end_x-j,i)];
          record(end_x-j,i)=record(end_x-j,i)+1;
          if j>1
             for s=1:j-1
          path=[path array(end_x-j+s,i+1)]; 
          record(end_x-j+s,i+1)=record(end_x-j+s,i+1)+1;
             end
          end
          else
             path=[path array(end_x,i)];
             record(end_x,i)=record(end_x,i)+1;
          end
  end
  end_x=end_x-1;
  if end_x<begin_x
      break
  end
  for i=end_x:-1:begin_x
      if a(i,end_y)==1
          j=1;
          while(a(i,end_y-j)==1)
              path=[path array(i+1,end_y-j)];
              record(i+1,end_y-j)=record(i+1,end_y-j)+1;
              j=j+1;
          end
          path=[path array(i,end_y-j)];
          record(i,end_y-j)=record(i,end_y-j)+1;
          if j>1
             for s=1:j-1
          path=[path array(i-1,end_y-j+s)];  
          record(i-1,end_y-j+s)=record(i-1,end_y-j+s)+1;
             end
          end
      else
          path=[path array(i,end_y)];
          record(i,end_y)=record(i,end_y)+1;
      end
  end
  end_y=end_y-1;
  if begin_y>end_y
      break
  end
  for i=end_y:-1:begin_y
        if a(begin_x,i)==1
          j=1;
          while(a(begin_x+j,i)==1)
              path=[path array(begin_x+j,i+1)];
              record(begin_x+j,i+1)=record(begin_x+j,i+1)+1;
              j=j+1;
          end
          path=[path array(begin_x+j,i)];
          record(begin_x+j,i)=record(begin_x+j,i)+1;
          if j>1
             for s=1:j-1
          path=[path array(begin_x+j-s,i-1)]; 
          record(begin_x+j-s,i-1)=record(begin_x+j-s,i-1)+1;
             end
          end
        else
             path=[path array(begin_x,i)];
             record(begin_x,i)=record(begin_x,i)+1;
        end
  end
  begin_x=begin_x+1;
  if end_x<begin_x
      break
  end
  end  
end
