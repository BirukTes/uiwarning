function TabGroup = uiwarning(uifigureObj, title, message, showBackground, delay)
    % uiWarining shows a warning dialog based on uitabgroup with parameter to delay user interaction
    %
    % uifigureObj     - uifigure
    % title           - char/string
    % message         - char/string
    % showBackground  - logical
    % delay           - 0 or int (or whole double) - disables 'OK' until end of delay
    
    windowWidth = uifigureObj.Position(3);
    windowHeight = uifigureObj.Position(4);
    centreTabX = (windowWidth - 410) / 2;
    centreTabY = (windowHeight - 210) / 2;
    
    if showBackground
        % Create HTML
        HTML = uihtml(uifigureObj);
        HTML.HTMLSource = '<html><body style="background-color: rgb(0, 0 ,0, 0.4);"></body></html>';
        HTML.Visible = 'on';
        HTML.Position = [0, 0, windowWidth+1, windowHeight+2];
    end
    
    % Create TabGroup
    TabGroup = uitabgroup(uifigureObj);
    TabGroup.Position = [centreTabX, centreTabY, 410, 210];
    
    % Create ApplicationConsiderationsTab
    ApplicationConsiderationsTab = uitab(TabGroup);
    ApplicationConsiderationsTab.Title = title;
    ApplicationConsiderationsTab.BackgroundColor = [0.94,0.94,0.94];
    
    % Create HTML
    HTML_2 = uihtml(ApplicationConsiderationsTab);
    HTML_2.Position = [70 45 330 130];
    HTML_2.HTMLSource = strcat("<html><body style='font-family: Helvetica; font-size:  12px; color: rgb(38, 38 ,38, 1);'>", message, "</body></html>");
    
     % Create OKButton
    OKButton = uibutton(ApplicationConsiderationsTab, 'push');
    OKButton.FontName = 'Helvetica';
    OKButton.Position = [300 10 100 25];
    OKButton.Text = 'OK';
    if delay
        OKButton.Enable = 'off';
    end
    OKButton.ButtonPushedFcn = @(src, event)OKButtonPushed();
    
    Image = uiimage(ApplicationConsiderationsTab);
    Image.Position = [5 124 60 40];
    Image.ImageSource = 'OpenmojiWarningIcon.png';
    
    if delay
        % Create Label
        Label = uilabel(ApplicationConsiderationsTab);
        Label.FontName = 'Helvetica';
        Label.FontAngle = 'italic';
        Label.FontSize = 10;
        Label.Position = [1 11 38 22];
        for c = delay:-1:1
            Label.Text = sprintf("  %s", num2str(c));
            pause(1)
        end
        Label.Visible = 'off';
        OKButton.Enable = 'on';
    end
    
    function OKButtonPushed()
        delete(TabGroup)
        if showBackground
            delete(HTML)
        end
    end
end
