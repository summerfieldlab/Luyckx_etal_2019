function [com] = pop_plotERPArray(INERP)

    g1 = [0.5 0.5 ];
    s1 = [1];
    geometry = { g1 s1 g1 s1 g1 s1 g1 s1 g1 g1 g1 s1 s1 s1 s1 s1 };
    uilist = { ...
          { 'Style', 'text', 'string', 'ERP Bin'} ...
          { 'Style', 'edit', 'string', '1' 'tag' 'Bin' } ...
          ...
          { } ...
          ...
          { 'Style', 'text', 'string', 'Plot Polarity'  } ...
          { 'Style', 'popupmenu', 'string', 'Positive Down | Positive Up' 'tag' 'Polarity' } ...
          ...
          { } ...
          ...
          { 'Style', 'text', 'string', 'Display Axis on Channel'  } ...
          { 'Style', 'edit', 'string', 'M1' 'tag' 'ChannelScale' } ...
          ...
          { } ...
          ...
          { 'Style', 'text', 'string', 'Smooth Data'  } ...
          { 'Style', 'popupmenu', 'string', 'False | True' 'tag' 'Smooth' } ...
          ...
          { } ...
          ...
          { 'Style', 'text', 'string', 'Plot Location and Size'  } ...
          { 'Style', 'edit', 'string', '[200,200,1600,800]' 'tag' 'guiSize'  } ...
          ...
          { } ...
          { 'Style', 'text', 'string', 'pixels: (right, up, wide, tall)'  } ...
          ...
          { 'Style', 'text', 'string', 'Font Size' } ...
          { 'Style', 'edit', 'string', '8' 'tag' 'guiFontSize' } ...
          ...
          { } ...
          ...
          { 'Style', 'text', 'string', 'Arrow Up and Down scale the amplitude.' } ...
          ...
          { 'Style', 'text', 'string', 'Holding shift while using the up and down arrow will linearly shift' } ...
          ...
          { 'Style', 'text', 'string', 'the axis up or down.' } ...
          ...
          { } ...
          ...
      };
 
      [ tmp1 tmp2 strhalt structout ] = inputgui( geometry, uilist, 'pophelp(''pop_plotERParray'');', 'Plot ERP Activity -- pop_plotERParray');
      if ~isempty(structout)
          structout.Bin = str2num(structout.Bin);
          structout.guiFontSize = str2num(structout.guiFontSize);
          structout.guiSize = str2num(structout.guiSize);
          if (structout.Polarity == 1)
              structout.Polarity = 'Positive Down';
          else
              structout.Polarity = 'Positive Up';
          end
          if (structout.Smooth == 1)
              structout.Smooth = 'False';
          else
              structout.Smooth = 'True';
          end
          com = sprintf('\n%%Equivalent command:\n plotERParray(%s, ''Bin'', %d, ''ChannelScale'', ''%s'', ''Polarity'', ''%s'', ''Smooth'', ''%s'', ''guiSize'', %s, ''guiFontSize'', %d);\n',inputname(1), structout.Bin, structout.ChannelScale, structout.Polarity, structout.Smooth, mat2str(structout.guiSize), structout.guiFontSize);
          disp(com)
          plotERParray(INERP, 'Bin', structout.Bin, 'ChannelScale', structout.ChannelScale, 'Polarity', structout.Polarity, 'Smooth', structout.Smooth,'guiSize', structout.guiSize, 'guiFontSize', structout.guiFontSize);
      else
          com = '';
      end

end