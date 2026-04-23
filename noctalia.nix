{ pkgs, inputs, ... } 
{
	imports = [ inputs.noctalia.homeModules.default ];
	
	programs.noctalia-shell = {
		enable = true;
		settings = {
			bar = {
				density = "compact";
				position = "top";
				widgets = {
					left = [
						{
							id = "Launcher";
						}
						{
							id = "ActiveWindow";
						}
					];
					center = [
						{
							id = "Workspace";
							hideUnoccupied = false;
							labelMode = "none";
						}
					];
					right = [
						{
							id = "Network";
						}
						{
							id = "Bluetooth";
						}
						{
							id = "Battery";
							warningThreshold = 20;
						}
						{
							id = "Volume";
						}
						{
							id = "Clock";
							useMonospacedFont = false;
						}
						{
							id = "ControlCenter";
						}
					];
				};
			};
			general = {
				#avatarImage = "/home/aron/.avatar";
			};
			location = {
				name = "Kerala, India";
				monthBeforeDay = false;	
			};
		};
	};
}
