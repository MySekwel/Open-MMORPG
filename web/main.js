let ThemeBtn = document.querySelector('input');
let defaultTheme = true;
let getBody = document.body;



ThemeBtn.addEventListener('click', () =>{

	if(defaultTheme == true)
	{
		document.body.style.backgroundImage = "url('../web/images/background-dark.gif')";
		document.body.style.backgroundColor = "black";
		defaultTheme = false;
	}
	else if(defaultTheme == false)
	{
		document.body.style.backgroundImage = "url('../web/images/background.gif')";
		document.body.style.backgroundColor = "rgb(61, 4, 63)";
		defaultTheme = true;
	}

	return 1;
});


console.log(ThemeBtn);
console.log(defaultTheme);
