function ss() { sudo service $1 start }
function sr() { sudo service $1 restart }
function sp() { sudo service $1 stop }
function st() { sudo service $1 status }
function se() { sudo chkconfig $1 on }
function sd() { sudo chkconfig $1 off }
