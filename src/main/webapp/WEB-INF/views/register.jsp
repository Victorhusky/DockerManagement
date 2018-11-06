<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Rigester</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="css/main.css" rel="stylesheet">
    
</head>
<body>
<div id="wrapper" class="divided">
    <section class="wrapper style1 align-center" id="reference">
        <div class="inner">
    <div class="index align-left">
<section>
    <header>
        <h2>Register</h2>
    </header>
    <div class="content">
		<table>
		<tl>
        <form method="post" action="./userregister">
            <div class="field half first">
                <label for="name"><b>Name</b></label>
                <input type="text" name="name" id="name" value="" placeholder="Cant be null"/>
                
            </div>
            </tl>
			
			
            <div class="field first">
				<input type="radio" id="priority-low" name="role" value="user" checked />
				<label for="priority-low">Normal User</label>
				</div>
				
				<div class="field third">
					<input type="radio" id="priority-normal" name="role" value="admin"/>
					<label for="priority-normal">Administater User</label> 
					</div>
            

            <div class="field half first">
                <label for="password">Password</label>
                <input type="password" name="password" id="password" value="" placeholder="Cant be null"/>
                
            </div>
            </tl>
            <tl>
            <div class="field half first">
                <label for="password1"> Email Address</label>
                <input type="text" name="password1" id="password1" value="" placeholder="Cant be null"/>
                
            </div></tl>
            <tl>
            <div class="field half first">
                <input type="checkbox" id="human" name="human" checked />
                <label for="human">I am a human and not a robot</label>
            </div>
            </tl>
            <tl>
            <ul class="actions">
                <li></li>
                <li><input type="submit" name="submit" id="submit" value="Register" /></li>
            </ul></tl>
        </form>
        </table>

    </div>
</section>
           </div>
        </div>
    </section>
</div>
</body>
</html>