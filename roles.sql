Create Procedure spTest(@UserName varchar(20),@UserPwd varchar(max))
AS
Begin
select UserName,UserPwd from Users where UserName=@UserName And UserPwd = @UserPwd
End

exec spTest 'miranda','123456'

Create Role hrAccessDB 

grant execute on spTest to hrAccessDB

deny alter on dbo.Employees to hrAccessDB
deny alter on dbo.Positions to hrAccessDB
deny alter on dbo.SalaryChange to hrAccessDB
deny alter on dbo.SKey to hrAccessDB
deny alter on dbo.Users to hrAccessDB

exec sp_addrolemember 'hrAccessDB', 'hradminUser'

select * from Users
