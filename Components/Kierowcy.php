<?php

class Kierowcy
{
    /*constructor*/
    function __construct($name)
    {
        $this->name = $name;
    }

    /* Member variables */
    var $name;
    var $age;

    /* Member functions */
    function setAge($age)
    {
        $this->age = $age;
    }

    function getAge()
    {
        echo $this->age . "<br/>";
    }

    function setName($name)
    {
        $this->name = $name;
    }

    function getName()
    {
        echo $this->name . " <br/>";
    }
}
