let enteredDoorCode = true
let passedRetinaScan = false
let hasDoorKey = false
let knowsOverridePassword = true

if enteredDoorCode && (passedRetinaScan || hasDoorKey)  {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
