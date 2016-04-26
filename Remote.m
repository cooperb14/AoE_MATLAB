% Art of Engineering Final Project
%Group: Holy Chicks
%
% Samuel Castro
% Lindsay Testa
% Cooper Bates
% Michael Kuzbel
% Bianca Gotuaco


function varargout = Remote(varargin)
% REMOTE MATLAB code for Remote.fig
% For all functions:
%   varargout  cell array for returning output args (see VARARGOUT);
%   hObject    handle to figure
%   eventdata  reserved - to be defined in a future version of MATLAB
%   handles    structure with handles and user data (see GUIDATA)

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Remote_OpeningFcn, ...
                   'gui_OutputFcn',  @Remote_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end
    
if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


    % --- Executes just before Remote is made visible.
function Remote_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.

% Choose default command line output for Remote
handles.output = hObject;

handles.chan_threshold = 200;
handles.vol_threshold = 25;

% Initialize all tv attributes
handles.power = 'off';
handles.input = 'tv';

handles.volume = 15;
handles.channel = 1;
handles.playback = 'play';

handles.life_alert = 0;
handles.guide = 0;

handles.last_volume = handles.volume;
handles.last_channel = handles.channel;

handles.fav_1 = 0;
handles.fav_2 = 0;
handles.fav_3 = 0;
handles.fav_4 = 0;
handles.fav_5 = 0;
handles.fav_6 = 0;

% Update handles structure
guidata(hObject, handles);


% --- Outputs from this function are returned to the command line.
function varargout = Remote_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in power_button.
function power_button_Callback(hObject, eventdata, handles)

switch handles.power
    case 'off'
        handles.power = 'on';
    case 'on'
        handles.power = 'off';
end

% Display tv attributes and update handles structure
display(hObject, handles);
guidata(hObject, handles);
    


% --- Executes on button press in fav_channel_1.
function fav_channel_1_Callback(hObject, eventdata, handles)

if handles.fav_1
    handles.channel = handles.fav_1;
else
    handles.fav_1 = handles.channel;
end

% Display tv attributes and update handles structure
display(hObject, handles);
guidata(hObject, handles);

% --- Executes on button press in fav_channel_2.
function fav_channel_2_Callback(hObject, eventdata, handles)

if handles.fav_2
    handles.channel = handles.fav_2;
else
    handles.fav_2 = handles.channel;
end

% Display tv attributes and update handles structure
display(hObject, handles);
guidata(hObject, handles);


% --- Executes on button press in fav_channel_3.
function fav_channel_3_Callback(hObject, eventdata, handles)

if handles.fav_3
    handles.channel = handles.fav_3;
else
    handles.fav_3 = handles.channel;
end

% Display tv attributes and update handles structure
display(hObject, handles);
guidata(hObject, handles);

% --- Executes on button press in fav_channel_4.
function fav_channel_4_Callback(hObject, eventdata, handles)

if handles.fav_4
    handles.channel = handles.fav_4;
else
    handles.fav_4 = handles.channel;
end

% Display tv attributes and update handles structure
display(hObject, handles);
guidata(hObject, handles);

% --- Executes on button press in fav_channel_5.
function fav_channel_5_Callback(hObject, eventdata, handles)

if handles.fav_5
    handles.channel = handles.fav_5;
else
    handles.fav_5 = handles.channel;
end

% Display tv attributes and update handles structure
display(hObject, handles);
guidata(hObject, handles);


% --- Executes on button press in fav_channel_6.
function fav_channel_6_Callback(hObject, eventdata, handles)

if handles.fav_6
    handles.channel = handles.fav_6;
else
    handles.fav_6 = handles.channel;
end

% Display tv attributes and update handles structure
display(hObject, handles);
guidata(hObject, handles);

% --- Executes on button press in dvd_input.
function dvd_input_Callback(hObject, eventdata, handles)

handles.input = 'dvd';

% Display tv attributes and update handles structure
display(hObject, handles);
guidata(hObject, handles);

 % --- Executes on button press in tv_input.
function tv_input_Callback(hObject, eventdata, handles)

handles.input = 'tv';

% Display tv attributes and update handles structure
display(hObject, handles);
guidata(hObject, handles);


% --- Executes on button press in back_button.
function back_button_Callback(hObject, eventdata, handles)

handles.volume = handles.last_volume;
handles.channel = handles.last_channel;

% Display tv attributes and update handles structure
display(hObject, handles);
guidata(hObject, handles);


% --- Executes on button press in mute_button.
function mute_button_Callback(hObject, eventdata, handles)

if handles.volume
    handles.last_volume = handles.volume;
    handles.volume = 0;
else
    handles.volume = handles.last_volume;
end

% Display tv attributes and update handles structure
display(hObject, handles);
guidata(hObject, handles);


% --- Executes on button press in up_button.
function up_button_Callback(hObject, eventdata, handles)

handles.last_volume = handles.volume;

if handles.volume < handles.vol_threshold
    handles.volume = handles.volume + 1;
end

% Display tv attributes and update handles structure
display(hObject, handles);
guidata(hObject, handles);


% --- Executes on button press in down_button.
function down_button_Callback(hObject, eventdata, handles)

handles.last_volume = handles.volume;

if handles.volume > 0;
    handles.volume = handles.volume - 1;
end

% Display tv attributes and update handles structure
display(hObject, handles);
guidata(hObject, handles);


% --- Executes on button press in left_button.
function left_button_Callback(hObject, eventdata, handles)

if tv_in(handles) && handles.channel > 1
    handles.last_channel = handles.channel;
    handles.channel = handles.channel - 1;
elseif dvd_in(handles)
    if strcmp(handles.playback, '<')
        handles.playback = '<<';
    elseif strcmp(handles.playback, '<<')
    else
        handles.playback = '<';
    end
end

% Display tv attributes and update handles structure
display(hObject, handles);
guidata(hObject, handles);


% --- Executes on button press in right_button.
function right_button_Callback(hObject, eventdata, handles)

if tv_in(handles) && handles.channel < handles.chan_threshold
    handles.last_channel = handles.channel;
    handles.channel = handles.channel + 1;
elseif dvd_in(handles)
    if strcmp(handles.playback, '>')
        handles.playback = '>>';
    elseif strcmp(handles.playback, '>>')
    else
        handles.playback = '>';
    end
end


% Display tv attributes and update handles structure
display(hObject, handles);
guidata(hObject, handles);

% --- Executes on button press in center_button.
function center_button_Callback(hObject, eventdata, handles)

if tv_in(handles)
    if handles.guide
        handles.guide = 0;
    else
        handles.guide = 1;
    end
elseif dvd_in(handles)
    if strcmp(handles.playback, 'play')
        handles.playback = 'paused';
    else
        handles.playback = 'play';
    end
end

% Display tv attributes and update handles structure
display(hObject, handles);
guidata(hObject, handles);


% --- Executes on button press in help_button.
function help_button_Callback(hObject, eventdata, handles)

handles.life_alert = 1;

% Display tv attributes and update handles structure
display(hObject, handles);
guidata(hObject, handles);


% --- Executes on button press in home_button.
function home_button_Callback(hObject, eventdata, handles)

handles.input = 'tv';
handles.volume = 5;
if handles.fav_1
    handles.channel = handles.fav_1;
else
    handles.channel = 1;
end

% Display tv attributes and update handles structure
display(hObject, handles);
guidata(hObject, handles);


function display(hObject, handles)
if tv_on(handles)
    head = 'Power:  %s\nInput:  %s\nVolume: %d\n';
    if handles.life_alert
    head = strcat('Life Alert Activated!\nHelp is on the way\n\n',head);
    end
    d = {handles.power, handles.input, handles.volume};
    if tv_in(handles)
        channel = handles.channel;
        s = sprintf(strcat(head,'Channel: %d\n'),d{1}, d{2},d{3}, channel);
        if handles.guide
            s = strcat(s, sprintf('\nGuide Menu Activated\n'));
        end
        set(handles.tv_state, 'String', s);
    elseif dvd_in(handles)
        play_b = handles.playback;
        s = sprintf(strcat(head,'Playback: %s\n'),d{1}, d{2},d{3}, play_b);
        set(handles.tv_state, 'String', s);
    end
else
    set(handles.tv_state, 'String', '');
end


function [result] = tv_in(handles)
result = strcmp(handles.input,'tv');

function [result] = dvd_in(handles)
result = strcmp(handles.input,'dvd');

function [result] = tv_on(handles)
result = strcmp(handles.power, 'on');
