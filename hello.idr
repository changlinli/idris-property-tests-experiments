addOne : Int -> Int
addOne x = x + 1

add0 : (Int, Int) -> Int
add0 (x, y) = x + y

add1 : Int -> Int -> Int
add1 x y = x + y

myNewFunction : Int -> Int
myNewFunction = add1 1

myFinalNumber = myNewFunction 5 -- 6
-- same thing as myFinalNumber = ((add1 1) 5)

isIntTypeOrStringType : Int -> Type
isIntTypeOrStringType x = 
  case x of
       0 => Int
       1 => String
       _ => Int

myInteger : isIntTypeOrStringType 0
myInteger = 5

generateSomeValueFromUnknownInput : Int -> String
generateSomeValueFromUnknownInput x = 
  case x of
       1 => 
         let
           someOtherString : isIntTypeOrStringType x
           someOtherString = "hello"
         in
         someOtherString
       0 => "0 branch"
       _ => "got something else"


data CustomColor = Red | Blue | Green

myCustomColor : CustomColor
myCustomColor = Red

data CustomColor0 : Type where
  Red0 : CustomColor0
  Blue0 : CustomColor0
  Green0 : CustomColor0

data Option a = Some a | Nothing

integerDivision : Int -> Int -> Option Int
integerDivision x y =
  case y of
       0 => Nothing
       _ => Some 0 -- imagine this was an actual division function

data Option0 : (t : Type) -> Type where
  Some0 : t -> Option0 t
  Nothing0 : Option0 t

data IsEqual : (t : Type) -> (x : t) -> (y : t) -> Type where
  ReflexivelyEqual : IsEqual t x x

fiveIsEqualToFive : IsEqual Int 5 5
fiveIsEqualToFive = ReflexivelyEqual


twoPlusThreeIsEqualToFive : IsEqual Int 5 (2 + 3)
twoPlusThreeIsEqualToFive = ReflexivelyEqual

twoPlusThreeIsEqualToFive0 : 5 = 2 + 3
twoPlusThreeIsEqualToFive0 = Refl

getTheStatisticalVarianceOfMyValues : (xs : List Double) -> ((length xs >= 2) = True) -> Double
getTheStatisticalVarianceOfMyValues xs proofOfLength = 0.0

data IsSanitized : (xs : String) -> Type where
  ProofOfSanitization : (x : String) -> IsSanitized x

sanitizeString : (xs : String) -> (xs, IsSanitized xs)
sanitizeString someString = (someString, ProofOfSanitization someString) -- fake implementation

checkIfLoginCredsAreValid : String -> String -> Bool
checkIfLoginCredsAreValid username password =
  selectFromDB ("SELECT username, password FROM users_table WHERE username = " + username + " and password = " + password + ";")

checkIfStringIsNotTooLong : String -> Bool
checkIfStringIsNotTooLong xs = if length xs > 1000 then False else True

proveThatCheckStringActuallyChecks : (xs : String) -> checkIfStringIsNotTooLong xs = True -> ((length xs) <= 1000 = True)
proveThatCheckStringActuallyChecks = ???

-- untrustedInput : String
-- untrustedInput = ???
--
-- (sanitizedInput, proofOfSanitization) = sanitizeString untrustedInput

-- checkedValue = checkIfStringIsNotTooLong sanitizedInput
--
-- if checkedValue
--   let
--     proofOfLength = proveThatCheckStringActuallyChecks sanitizedInput checkedValue
--   in
--   persistAnElementToTheDatabase sanitizedInput proofOfLength proofOfSanitization -- this can be successfully called
-- else
--   -- tell the user to input something else
--
--
--
--
--
--
--
--

-- write a test that generates a million random strings and makes sure that if checkIfStringIsNotTooLong is True then the length is actually less than or equal to 1000



persistAnElementToTheDatabase : (xs : String) -> ((length xs <= 1000) = True) -> (IsSanitized xs) -> ()
persistAnElementToTheDatabase userInput proofOfLessThan1000 proofThatUserInputIsSanitized = ()


proveThatAdditionCommutes : (x : Int) -> (y : Int) -> x + y = y + x
proveThatAdditionCommutes = -- this is kind of hard


-- runtime notion of equality and translate into a compile time equality

-- == -> =

propertyTest : Gen (Int, Int) 
  -> ((Int, Int) -> Bool)
  -> ()

someIntGenerator : Gen (Int, Int)
someIntGenerator = ???

propositionThatAdditionCommutes : (Int, Int) -> Bool
propositionThatAdditionCommutes (x, y) = x + y == y + x

-- Tests.idr
myTest = propertyTest someIntGenerator propositionThatAdditionCommutes

testTranslator : (Gen (Int, Int) -> (f : (Int, Int) -> Bool) -> ()) -> ((x : Int, y : Int) -> f (x, y) = True)
testTranslator = 
