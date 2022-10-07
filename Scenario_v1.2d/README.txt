Run this Lab script command on the workstation machine
"lab install-troubleshoot start" or "lab execute-troubleshoot start"

1. Log in as the 'kubeadmin' user by using the password available 
	[it will be available @ /usr/local/etc/ocp4.config in the workstation]

2. Then change in to the directory where the script files available.
   First Run 'project.sh' script to create required projects.

3. Run the script file called fullReset.sh [you will notice some errors you can ignore it]

4. Then start doing the question number 1 to 6.

5. After completing the question number 6, then switch-over to the directoy where the script files available and execute startSCENARIO.sh script which will emulate scenario based condition as in the exam.
[Note pls don't execute this script before finishing up to question 6].

6. Once done with all the question again change over to the directoy where the script files available and execute fullReset.sh script to start over and repeat the step 4 and step 5 again.
[No need to run step 1 and lab setup command unless you have deleted the lab]

7. Don't Delete kubeadmin user during practice, if deleted recreate the lab.
