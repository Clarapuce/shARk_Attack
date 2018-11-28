function [frameChange] = ramenerMain(frameInit,frameChange,main)
pos = find(main==1);
frameChange(pos) = frameInit(pos);
end
