class ValidationEmptyField{
   bool isFieldEmpty(String  fieldvalue) => fieldvalue?.isEmpty ?? true;

   bool validationEmailAddress(String email){
     if (email == null) {
       return false;
     }

     return RegExp(
         r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
         .hasMatch(email);
   }
}