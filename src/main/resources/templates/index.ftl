<!DOCTYPE html>
<head>
    <title>Pizza Force order page</title>
    <link rel="stylesheet" type="text/css" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="/stylesheets/main.css"/>
</head>

<body>

<div class="jumbotron text-center">
    <div class="container">
        <h1 class="white">Pizza Force</h1>
        <p class="white">The toughest pizza on Salesforce!</p>
    </div>
</div>
<div class="container">
    <META HTTP-EQUIV="Content-type" CONTENT="text/html; charset=UTF-8">

    <div class="col-md-2"></div>
    <div class="col-md-8">
        <H2 class="align-center">Order form</H2>
        <form action="https://webto.salesforce.com/servlet/servlet.WebToCase?encoding=UTF-8" method="POST">

            <input type=hidden name="orgid" value="00D6F000002T87k">
            <input type=hidden name="retURL" value="https://pizza-force.herokuapp.com/">
            <input type="hidden" id="subject" maxlength="80" name="subject" size="20"
                   value="Order from pizza-force.herokuapp.com"/><br>

            <div class="form-group">
                <label for="name">Name: <span class="red">*</span></label>
                <input class="form-control" id="name" maxlength="80" name="name" size="20" type="text"
                       placeholder="John Snow" required="" pattern="^[A-Z][a-z]+\s[A-Z][a-z]+$"
                       title="Example: John Dou"/>
            </div>

            <div class="form-group">
                <label for="email">Email: <span class="red">*</span></label>
                <input class="form-control" id="email" maxlength="80" name="email" size="20" type="text"
                       placeholder="john_snow@gmail.com" required=""/>
            </div>
            <div class="form-group">
                <label for="phone">Phone: <span class="red">*</span></label>
                <input class="form-control" id="phone" maxlength="40" name="phone" size="20" type="text"
                       placeholder="+375291234567" required=""/>
            </div>

            <div class="form-group">
                <label for="00N6F00000OenDs">Delivery Address: <span class="red">*</span></label>
                <input id="00N6F00000OenDs" class="form-control" maxlength="255" name="00N6F00000OenDs" size="20"
                       type="text"/>
            </div>

            <div class="form-group">
                <label for="description">Description: <span class="red">*</span></label>
                <textarea class="form-control" name="description"></textarea>
            </div>

            <div class="row">
                <div class="col">
                    <label for="dish">Dish</label>
                    <select name="dish" class="form-control">
                        <#list model["dishes"] as dish>
                            <option value="${dish.name} ${dish.id}">
                                ${dish.name}
                            </option>
                        </#list>
                    </select>
                </div>

                <div class="col">
                    <label for="dish">Dish</label>
                    <input name="quantity" type="number" class="form-control" value="1"
                           placeholder="Type in quantity...">
                </div>
            </div>

            <input type="submit" class="btn btn-primary" name="submit">
        </form>
    </div>

<#--    <table border="1">
        <tr>
            <th>Id</th>
            <th>Name</th>
        </tr>
        <#list model["dishes"] as dish>
        <tr>
            <td><#if dish.id??>${dish.id}<#else>no dish id</#if></td>
            <td><#if dish.name??>${dish.name}<#else>no dish name</#if></td>
        </tr>
        </#list>
    </table>-->

    <div class="col-md-2"></div>
</div>

<div class="pf-bottom">
    <div class="container">
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <span>&copy;Pizza-force</span>
        </div>
        <div class="col-md-2"></div>
    </div>

</div>
<script>

</script>
</body>
</html>
