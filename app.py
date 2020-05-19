import os
from flask import Flask, render_template, flash, redirect, url_for, logging, request, session ,jsonify
import mysql.connector
from mysql.connector import Error
from functools import wraps
from werkzeug import secure_filename
import json
import datetime

app = Flask(__name__)


connection = mysql.connector.connect(host='localhost',
                             database='jewellery',
                             user='root',
                             password='',
                             buffered=True)
 
@app.route('/admin_layout')
def admin_layout():
    return render_template('admin_layout.html')

@app.route('/admin_stock')
def admin_stock():
    return render_template('stock1.html')

@app.route('/admin_feedback')
def admin_stock1():
    return render_template('newfilew1.html')

@app.route('/admin_offer')
def admin_1():
    return render_template('offer.html')

@app.route('/admin_offer1')
def admin_11():
    return render_template('feedback1.html')

@app.route('/ring')
def ring():
    return render_template('ring.html')

@app.route('/customer_login')
def customer_login():
    return render_template('customer_login.html')

@app.route('/admin_layout1')
def admin_layout1():
    return render_template('admin_layout1.html')

@app.route('/customer_layout')
def customer_layout():
    return render_template('customer_layout.html')

@app.route('/customer_layout1')
def customer_layout1():
    return render_template('customer_layout1.html')

@app.route('/logout')
def logout():
    session.clear()
    flash('You are now logged out','success')
    return redirect(url_for('customer_login'))


@app.route('/admin_logout')
def admin_logout():
    flash('You are now logged out','success')
    return redirect(url_for('admin_login'))


@app.route('/admin_register', methods=['GET','POST'])
def admin_register():
    if request.method == 'POST':
        admin_name = request.form.get('admin_name')
        admin_password = request.form.get('admin_password')
        admin_confirm = request.form.get('admin_confirm')
        admin_mailid = request.form.get('admin_mailid')
        admin_phno = request.form.get('admin_phno')       
        cur = connection.cursor()
        if admin_password == admin_confirm:
          cur.execute("INSERT INTO admin(admin_name,admin_password,admin_mailid,admin_phno) VALUES(%s,%s,%s,%s)",(admin_name,admin_password,admin_mailid,admin_phno))
          connection.commit()
          cur.close()
          flash('You are Registered successfully','success')
          return redirect(url_for('admin_login'))
        else:
          flash('You are password and confirm password does not match','failed')
          return render_template('admin_register.html')

    return render_template('admin_register.html')


@app.route('/register', methods=['GET','POST'])
def register():
    if request.method == 'POST':
        name = request.form.get('name')
        password = request.form.get('password')
        confirm = request.form.get('confirm')
        mailid = request.form.get('mailid')
        phno = request.form.get('phno')       
        cur = connection.cursor()
        if password == confirm:
          cur.execute("INSERT INTO user(customer_name,password,mailid,phno) VALUES(%s,%s,%s,%s)",(name,password,mailid,phno))
          connection.commit()
          cur.close()
          flash('You are Registered successfully','success')
          return redirect(url_for('login'))
        else:
          flash('You are password does not match','failed')
          return render_template('customer_register.html')

    return render_template('customer_register.html')

@app.route('/login',methods=['GET','POST'])
def login():
    if request.method == 'POST':
       mailid = request.form['mailid']
       password = request.form['password']
       cur = connection.cursor()
       cur.execute("SELECT * FROM user WHERE mailid= %s AND password= %s",[mailid,password])
       data = cur.fetchone()
       if data:
          mailid = data[3]
          customer_id = data[0]
          customer_name = data[1]
       if not data:
          error='USER ID/PASSWORD WRONG'
          return render_template('customer_login.html',error=error)
       else:
            session['logged_in'] = True
            session['mailid'] = mailid
            session['customer_id'] = customer_id
            flash('You are now logged in successfully','success')
       return redirect(url_for('customer_layout1'))
       cur.close()
    return render_template('customer_login.html')

@app.route('/admin_login',methods=['GET','POST'])
def admin_login():
    if request.method == 'POST':
       admin_mailid = request.form['admin_mailid']
       admin_password=request.form['admin_password']
       cur=connection.cursor()
       cur.execute("SELECT * FROM admin WHERE admin_mailid= %s AND admin_password= %s",[admin_mailid,admin_password])
       data = cur.fetchone()
       if not data:
          error='ADMIN ID/PASSWORD WRONG'
          return render_template('admin_login.html',error=error)
       else:
          flash('You are now logged in successfully','success')
          return redirect(url_for('admin_layout'))
       cur.close()
    return render_template('admin_login.html')

@app.route('/admin_addcategory',methods=['GET','POST'])
def admin_addcategory():
    if request.method == 'POST':
        categoryid = request.form.get('categoryid')
        categoryname = request.form.get('categoryname')
        cur = connection.cursor()
        cur.execute("INSERT INTO category(categoryid,categoryname) VALUES(%s,%s)",(categoryid,categoryname))
        connection.commit()
        cur.close()
        flash('Added successfully','success')
    return render_template('admin_addcategory.html')


@app.route('/admin_addornaments',methods=['GET','POST'])
def admin_addornaments():
    if request.method == 'POST':
        ornamentid = request.form.get('ornamentid')
        ornamentname = request.form.get('ornamentname')
        cur = connection.cursor()
        cur.execute("INSERT INTO ornaments(ornamentid,ornamentname) VALUES(%s,%s)",(ornamentid,ornamentname))
        connection.commit()
        cur.close()
        flash('Added successfully','success')
    return render_template('admin_addornaments.html')


@app.route('/admin_addproducts',methods=['GET','POST'])
def admin_addproducts():
    if request.method == 'POST':     
        product_id = request.form.get('product_id')   
        product_name = request.form.get('product_name')
        product_description = request.form.get('product_description')
        product_category = request.form.get('product_category')
        product_ornament = request.form.get('product_ornament')
        product_purity = request.form.get('product_purity')
        product_size =  request.form.get('product_size')
        product_quantity = request.form.get('product_quantity')
        product_quantityinstock = request.form.get('product_quantityinstock')
        product_weight = request.form.get('product_weight')
        product_makingprice = request.form.get('product_makingprice')
        product_price = request.form.get('product_price')
        f = request.files['product_image']
        f.save(secure_filename(f.filename))
        product_image = f.read()
        cur = connection.cursor()
        cur.execute("INSERT INTO product(product_id,product_name,product_description,product_category,product_ornament,product_size,product_purity,product_quantity,product_quantityinstock,product_weight,product_makingprice,product_price,product_image) VALUES(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,'%s')",(product_id,product_name,product_description,product_category,product_ornament,product_size,product_purity,product_quantity,product_quantityinstock,product_weight,product_makingprice,product_price,product_image))
        connection.commit()
        cur.close()
        flash('Added successfully','success')
    return render_template('admin_addproducts.html')    

@app.route('/admin_editbangles/<string:id>',methods=['GET','POST'])
def admin_editbangles(id):
    cur = connection.cursor()
    cur.execute("SELECT * FROM product WHERE product_id=%s",[id])
    bangle = cur.fetchone()
    cur.close()
    if request.method == 'POST':
        product_name = request.form.get('product_name')
        product_category = request.form.get('product_category')
        product_ornament = request.form.get('product_ornament')
        product_purity = request.form.get('product_purity')
        product_size =  request.form.get('product_size')
        product_quantity = request.form.get('product_quantity')
        product_quantityinstock = request.form.get('product_quantityinstock')
        product_weight = request.form.get('product_weight')
        product_makingprice = request.form.get('product_makingprice')
        product_price = request.form.get('product_price')
        cur = connection.cursor()
        cur.execute("UPDATE product SET product_name=%s, product_category=%s, product_ornament=%s, product_purity=%s, product_size=%s, product_quantity=%s, product_quantityinstock=%s, product_weight=%s, product_makingprice=%s, product_price=%s where product_id=%s",(product_name, product_category, product_ornament, product_size, product_purity, product_quantity, product_quantityinstock, product_weight, product_makingprice, product_price, id))
        cur.close()
        flash('Product modified successfully','success')
        return redirect(url_for('admin_viewbangles'))
    return render_template('admin_editbangles.html',data=bangle)

@app.route('/admin_editchains/<string:id>',methods=['GET','POST'])
def admin_editchains(id):
    cur = connection.cursor()
    cur.execute("SELECT * FROM product WHERE product_id=%s",[id])
    bangle = cur.fetchone()
    cur.close()
    if request.method == 'POST':
        product_name = request.form.get('product_name')
        product_category = request.form.get('product_category')
        product_ornament = request.form.get('product_ornament')
        product_purity = request.form.get('product_purity')
        product_size =  request.form.get('product_size')
        product_quantity = request.form.get('product_quantity')
        product_quantityinstock = request.form.get('product_quantityinstock')
        product_weight = request.form.get('product_weight')
        product_makingprice = request.form.get('product_makingprice')
        product_price = request.form.get('product_price')
        cur = connection.cursor()
        cur.execute("UPDATE product SET product_name=%s, product_category=%s, product_ornament=%s, product_purity=%s, product_size=%s, product_quantity=%s, product_quantityinstock=%s, product_weight=%s, product_makingprice=%s, product_price=%s where product_id=%s",(product_name, product_category, product_ornament, product_size, product_purity, product_quantity, product_quantityinstock, product_weight, product_makingprice, product_price, id))
        cur.close()
        flash('Product modified successfully','success')
        return redirect(url_for('admin_viewchains'))
    return render_template('admin_editchains.html',data=bangle)

@app.route('/admin_editearrings/<string:id>',methods=['GET','POST'])
def admin_editearrings(id):
    cur = connection.cursor()
    cur.execute("SELECT * FROM product WHERE product_id=%s",[id])
    bangle = cur.fetchone()
    cur.close()
    if request.method == 'POST':
        product_name = request.form.get('product_name')
        product_category = request.form.get('product_category')
        product_ornament = request.form.get('product_ornament')
        product_purity = request.form.get('product_purity')
        product_size =  request.form.get('product_size')
        product_quantity = request.form.get('product_quantity')
        product_quantityinstock = request.form.get('product_quantityinstock')
        product_weight = request.form.get('product_weight')
        product_makingprice = request.form.get('product_makingprice')
        product_price = request.form.get('product_price')
        cur = connection.cursor()
        cur.execute("UPDATE product SET product_name=%s, product_category=%s, product_ornament=%s, product_purity=%s, product_size=%s, product_quantity=%s, product_quantityinstock=%s, product_weight=%s, product_makingprice=%s, product_price=%s where product_id=%s",(product_name, product_category, product_ornament, product_size, product_purity, product_quantity, product_quantityinstock, product_weight, product_makingprice, product_price, id))
        cur.close()
        flash('Product modified successfully','success')
        return redirect(url_for('admin_viewearrings'))
    return render_template('admin_editearrings.html',data=bangle)

@app.route('/admin_editelena/<string:id>',methods=['GET','POST'])
def admin_editelena(id):
    cur = connection.cursor()
    cur.execute("SELECT * FROM product WHERE product_id=%s",[id])
    bangle = cur.fetchone()
    cur.close()
    if request.method == 'POST': 
        product_name = request.form.get('product_name')
        product_category = request.form.get('product_category')
        product_ornament = request.form.get('product_ornament')
        product_purity = request.form.get('product_purity')
        product_size =  request.form.get('product_size')
        product_quantity = request.form.get('product_quantity')
        product_quantityinstock = request.form.get('product_quantityinstock')
        product_weight = request.form.get('product_weight')
        product_makingprice = request.form.get('product_makingprice')
        product_price = request.form.get('product_price')
        cur = connection.cursor()
        cur.execute("UPDATE product SET product_name=%s, product_category=%s, product_ornament=%s, product_purity=%s, product_size=%s, product_quantity=%s, product_quantityinstock=%s, product_weight=%s, product_makingprice=%s, product_price=%s where product_id=%s",(product_name, product_category, product_ornament, product_size, product_purity, product_quantity, product_quantityinstock, product_weight, product_makingprice, product_price, id))
        cur.close()
        flash('Product modified successfully','success')
        return redirect(url_for('admin_viewelena'))
    return render_template('admin_editelena.html',data=bangle)

@app.route('/admin_editgina/<string:id>',methods=['GET','POST'])
def admin_editgina(id):
    cur = connection.cursor()
    cur.execute("SELECT * FROM product WHERE product_id=%s",[id])
    bangle = cur.fetchone()
    cur.close()
    if request.method == 'POST':
        product_name = request.form.get('product_name')
        product_category = request.form.get('product_category')
        product_ornament = request.form.get('product_ornament')
        product_purity = request.form.get('product_purity')
        product_size =  request.form.get('product_size')
        product_quantity = request.form.get('product_quantity')
        product_quantityinstock = request.form.get('product_quantityinstock')
        product_weight = request.form.get('product_weight')
        product_makingprice = request.form.get('product_makingprice')
        product_price = request.form.get('product_price')
        cur = connection.cursor()
        cur.execute("UPDATE product SET product_name=%s, product_category=%s, product_ornament=%s, product_purity=%s, product_size=%s, product_quantity=%s, product_quantityinstock=%s, product_weight=%s, product_makingprice=%s, product_price=%s where product_id=%s",(product_name, product_category, product_ornament, product_size, product_purity, product_quantity, product_quantityinstock, product_weight, product_makingprice, product_price, id))
        cur.close()
        flash('Product modified successfully','success')
        return redirect(url_for('admin_viewgina'))
    return render_template('admin_editgina.html',data=bangle)

@app.route('/admin_editnecklaces/<string:id>',methods=['GET','POST'])
def admin_editnecklaces(id):
    cur = connection.cursor()
    cur.execute("SELECT * FROM product WHERE product_id=%s",[id])
    bangle = cur.fetchone()
    cur.close()
    if request.method == 'POST': 
        product_name = request.form.get('product_name')
        product_category = request.form.get('product_category')
        product_ornament = request.form.get('product_ornament')
        product_purity = request.form.get('product_purity')
        product_size =  request.form.get('product_size')
        product_quantity = request.form.get('product_quantity')
        product_quantityinstock = request.form.get('product_quantityinstock')
        product_weight = request.form.get('product_weight')
        product_makingprice = request.form.get('product_makingprice')
        product_price = request.form.get('product_price')
        cur = connection.cursor()
        cur.execute("UPDATE product SET product_name=%s, product_category=%s, product_ornament=%s, product_purity=%s, product_size=%s, product_quantity=%s, product_quantityinstock=%s, product_weight=%s, product_makingprice=%s, product_price=%s where product_id=%s",(product_name, product_category, product_ornament, product_size, product_purity, product_quantity, product_quantityinstock, product_weight, product_makingprice, product_price, id))
        cur.close()
        flash('Product modified successfully','success')
        return redirect(url_for('admin_viewnecklaces'))
    return render_template('admin_editnecklaces.html',data=bangle)

@app.route('/admin_editnosepins/<string:id>',methods=['GET','POST'])
def admin_editnosepins(id):
    cur = connection.cursor()
    cur.execute("SELECT * FROM product WHERE product_id=%s",[id])
    bangle = cur.fetchone()
    cur.close()
    if request.method == 'POST': 
        product_name = request.form.get('product_name')
        product_category = request.form.get('product_category')
        product_ornament = request.form.get('product_ornament')
        product_purity = request.form.get('product_purity')
        product_size =  request.form.get('product_size')
        product_quantity = request.form.get('product_quantity')
        product_quantityinstock = request.form.get('product_quantityinstock')
        product_weight = request.form.get('product_weight')
        product_makingprice = request.form.get('product_makingprice')
        product_price = request.form.get('product_price')
        cur = connection.cursor()
        cur.execute("UPDATE product SET product_name=%s, product_category=%s, product_ornament=%s, product_purity=%s, product_size=%s, product_quantity=%s, product_quantityinstock=%s, product_weight=%s, product_makingprice=%s, product_price=%s where product_id=%s",(product_name, product_category, product_ornament, product_size, product_purity, product_quantity, product_quantityinstock, product_weight, product_makingprice, product_price, id))
        cur.close()
        flash('Product modified successfully','success')
        return redirect(url_for('admin_viewnosepins'))
    return render_template('admin_editnosepins.html',data=bangle)

@app.route('/admin_editpendants/<string:id>',methods=['GET','POST'])
def admin_editpendants(id):
    cur = connection.cursor()
    cur.execute("SELECT * FROM product WHERE product_id=%s",[id])
    bangle = cur.fetchone()
    cur.close()
    if request.method == 'POST': 
        product_name = request.form.get('product_name')
        product_category = request.form.get('product_category')
        product_ornament = request.form.get('product_ornament')
        product_purity = request.form.get('product_purity')
        product_size =  request.form.get('product_size')
        product_quantity = request.form.get('product_quantity')
        product_quantityinstock = request.form.get('product_quantityinstock')
        product_weight = request.form.get('product_weight')
        product_makingprice = request.form.get('product_makingprice')
        product_price = request.form.get('product_price')
        cur = connection.cursor()
        cur.execute("UPDATE product SET product_name=%s, product_category=%s, product_ornament=%s, product_purity=%s, product_size=%s, product_quantity=%s, product_quantityinstock=%s, product_weight=%s, product_makingprice=%s, product_price=%s where product_id=%s",(product_name, product_category, product_ornament, product_size, product_purity, product_quantity, product_quantityinstock, product_weight, product_makingprice, product_price, id))
        cur.close()
        flash('Product modified successfully','success')
        return redirect(url_for('admin_viewpendants'))
    return render_template('admin_editpendants.html',data=bangle)

@app.route('/admin_editrings/<string:id>',methods=['GET','POST'])
def admin_editrings(id):
    cur = connection.cursor()
    cur.execute("SELECT * FROM product WHERE product_id=%s",[id])
    bangle = cur.fetchone()
    cur.close()
    if request.method == 'POST': 
        product_name = request.form.get('product_name')
        product_category = request.form.get('product_category')
        product_ornament = request.form.get('product_ornament')
        product_purity = request.form.get('product_purity')
        product_size =  request.form.get('product_size')
        product_quantity = request.form.get('product_quantity')
        product_quantityinstock = request.form.get('product_quantityinstock')
        product_weight = request.form.get('product_weight')
        product_makingprice = request.form.get('product_makingprice')
        product_price = request.form.get('product_price')
        cur = connection.cursor()
        cur.execute("UPDATE product SET product_name=%s, product_category=%s, product_ornament=%s, product_purity=%s, product_size=%s, product_quantity=%s, product_quantityinstock=%s, product_weight=%s, product_makingprice=%s, product_price=%s where product_id=%s",(product_name, product_category, product_ornament, product_size, product_purity, product_quantity, product_quantityinstock, product_weight, product_makingprice, product_price, id))
        cur.close()
        flash('Product modified successfully','success')
        return redirect(url_for('admin_viewrings'))
    return render_template('admin_editrings.html',data=bangle)

@app.route('/admin_viewbangles',methods=['GET','POST'])
def admin_viewbangles():
    if request.method == 'GET':
         cur = connection.cursor()
         cur.execute("SELECT * FROM product WHERE product_ornament='Bangles'")
         data = cur.fetchall()
         cur.execute("SELECT * FROM product WHERE product_ornament='Bracelets'")
         data1 = cur.fetchall()
         cur.close()
    return render_template('admin_viewbangles.html',data=data,data1=data1)

@app.route('/admin_viewchains',methods=['GET','POST'])
def admin_viewchains():
    if request.method == 'GET':
         cur = connection.cursor()
         cur.execute("SELECT * FROM product WHERE product_ornament='Chains'")
         data = cur.fetchall()
         cur.close()
    return render_template('admin_viewchains.html',data=data)

@app.route('/admin_viewelena',methods=['GET','POST'])
def admin_viewelena():
    if request.method == 'GET':
         cur = connection.cursor()
         cur.execute("SELECT * FROM product where product_ornament='Elena'")
         data = cur.fetchall()
         cur.close()
    return render_template('admin_viewelena.html',data=data)

@app.route('/admin_viewearrings',methods=['GET','POST'])
def admin_viewearrings():
    if request.method == 'GET':
         cur = connection.cursor()
         cur.execute("SELECT * FROM product WHERE product_ornament='Earrings'")
         data = cur.fetchall()
         cur.close()
    return render_template('admin_viewearrings.html',data=data)

@app.route('/admin_viewnecklaces',methods=['GET','POST'])
def admin_viewnecklaces():
    if request.method == 'GET':
         cur = connection.cursor()
         cur.execute("SELECT * FROM product WHERE product_ornament='Necklace'")
         data = cur.fetchall()
         cur.close()
    return render_template('admin_viewnecklaces.html',data=data)

@app.route('/admin_viewpendants',methods=['GET','POST'])
def admin_viewpendants():
    if request.method == 'GET':
         cur = connection.cursor()
         cur.execute("SELECT * FROM product WHERE product_ornament='Pendants'")
         data = cur.fetchall()
         cur.close()
    return render_template('admin_viewpendants.html',data=data)

@app.route('/admin_viewrings',methods=['GET','POST'])
def admin_viewrings():
    if request.method == 'GET':
         cur = connection.cursor()
         cur.execute("SELECT * FROM product WHERE product_ornament='Rings'")
         data = cur.fetchall()
         cur.close()
    return render_template('admin_viewrings.html',data=data)

@app.route('/admin_viewnosepins',methods=['GET','POST'])
def admin_viewnosepins():
    if request.method == 'GET':
         cur = connection.cursor()
         cur.execute("SELECT * FROM product WHERE product_ornament='Nosepins'")
         data = cur.fetchall()
         cur.close()
    return render_template('admin_viewnosepins.html',data=data)

@app.route('/admin_viewgina',methods=['GET','POST'])
def admin_viewgina():
    if request.method == 'GET':
         cur = connection.cursor()
         cur.execute("SELECT * FROM product WHERE product_ornament='Gina'")
         data = cur.fetchall()
         cur.close()
    return render_template('admin_viewgina.html',data=data)
 

@app.route('/delete_productbangle/<string:id>', methods=['POST'])
def admin_deletebangle(id):
    cur = connection.cursor()
    cur.execute("DELETE FROM product WHERE product_id = %s", [id])
    cur.close()
    flash('Product deleted successfully', 'success')
    return redirect(url_for('admin_viewbangles'))

@app.route('/delete_productchain/<string:id>', methods=['POST'])
def admin_deletechain(id):
    cur = connection.cursor()
    cur.execute("DELETE FROM product WHERE product_id = %s", [id])
    cur.close()
    flash('Product deleted successfully', 'success')
    return redirect(url_for('admin_viewchains'))

@app.route('/delete_productearring/<string:id>', methods=['POST'])
def admin_deleteearring(id):
    cur = connection.cursor()
    cur.execute("DELETE FROM product WHERE product_id = %s", [id])
    cur.close()
    flash('Product deleted successfully', 'success')
    return redirect(url_for('admin_viewearrings'))

@app.route('/delete_productnecklace/<string:id>', methods=['POST'])
def admin_deletenecklace(id):
    cur = connection.cursor()
    cur.execute("DELETE FROM product WHERE product_id = %s", [id])
    cur.close()
    flash('Product deleted successfully', 'success')
    return redirect(url_for('admin_viewnecklaces'))

@app.route('/delete_productring/<string:id>', methods=['POST'])
def admin_deletering(id):
    cur = connection.cursor()
    cur.execute("DELETE FROM product WHERE product_id = %s", [id])
    cur.close()
    flash('Product deleted successfully', 'success')
    return redirect(url_for('admin_viewrings'))

@app.route('/delete_productpendant/<string:id>', methods=['POST'])
def admin_deletependant(id):
    cur = connection.cursor()
    cur.execute("DELETE FROM product WHERE product_id = %s", [id])
    cur.close()
    flash('Product deleted successfully', 'success')
    return redirect(url_for('admin_viewpendants'))

@app.route('/delete_productnosepin/<string:id>', methods=['POST'])
def admin_deletenosepin(id):
    cur = connection.cursor()
    cur.execute("DELETE FROM product WHERE product_id = %s", [id])
    cur.close()
    flash('Product deleted successfully', 'success')
    return redirect(url_for('admin_viewnosepins'))

@app.route('/delete_productelena/<string:id>', methods=['POST'])
def admin_deleteelena(id):
    cur = connection.cursor()
    cur.execute("DELETE FROM product WHERE product_id = %s", [id])
    cur.close()
    flash('Product deleted successfully', 'success')
    return redirect(url_for('admin_viewelena'))

@app.route('/delete_productgina/<string:id>', methods=['POST'])
def admin_deletegina(id):
    cur = connection.cursor()
    cur.execute("DELETE FROM product WHERE product_id = %s", [id])
    cur.close()
    flash('Product deleted successfully', 'success')
    return redirect(url_for('admin_viewgina'))

@app.route('/customer_viewgoldbangles',methods=['GET','POST'])
def customer_viewgoldbangles():
    if request.method == 'GET':
         cur = connection.cursor()
         cur.execute("SELECT * FROM product WHERE product_ornament='Bangles' AND product_category='Gold'")
         data = cur.fetchall()
         cur.execute("SELECT * FROM product WHERE product_ornament='Bracelets' AND product_category='Gold'")
         data1 = cur.fetchall()
         cur.close()
    return render_template('customer_viewgoldbangles.html',data=data,data1=data1)

@app.route('/customer_viewgoldchains',methods=['GET','POST'])
def customer_viewgoldchains():
    if request.method == 'GET':
         cur = connection.cursor()
         cur.execute("SELECT * FROM product WHERE product_ornament='Chains' AND product_category='Gold'")
         data = cur.fetchall()
         cur.close()
    return render_template('customer_viewgoldchains.html',data=data)
        
@app.route('/customer_viewgoldearrings',methods=['GET','POST'])
def customer_viewgoldearrings():
    if request.method == 'GET':
         cur = connection.cursor()
         cur.execute("SELECT * FROM product WHERE product_ornament='Earrings' AND product_category='Gold'")
         data = cur.fetchall()
         cur.close()
    return render_template('customer_viewgoldearrings.html',data=data)

@app.route('/customer_viewgoldpendants',methods=['GET','POST'])
def customer_viewgoldpendants():
    if request.method == 'GET':
         cur = connection.cursor()
         cur.execute("SELECT * FROM product WHERE product_ornament='Pendants' AND product_category='Gold'")
         data = cur.fetchall()
         cur.close()
    return render_template('customer_viewgoldpendants.html',data=data)
                      
@app.route('/customer_viewgoldrings',methods=['GET','POST'])
def customer_viewgoldrings():
    if request.method == 'GET':
         cur = connection.cursor()
         cur.execute("SELECT * FROM product WHERE product_ornament='Rings' AND product_category='Gold'")
         data = cur.fetchall()
         cur.close()
    return render_template('customer_viewgoldrings.html',data=data)     

@app.route('/customer_viewgoldnecklace',methods=['GET','POST'])
def customer_viewgoldnecklace():
    if request.method == 'GET':
         cur = connection.cursor()
         cur.execute("SELECT * FROM product WHERE product_ornament='Necklace' AND product_category='Gold'")
         data = cur.fetchall()
         cur.close()
    return render_template('customer_viewgoldnecklaces.html',data=data)

@app.route('/customer_viewsilverbangles',methods=['GET','POST'])
def customer_viewsilverbangles():
    if request.method == 'GET':
         cur = connection.cursor()
         cur.execute("SELECT * FROM product WHERE product_ornament='Bangles' AND product_category='Silver'")
         data = cur.fetchall()
         cur.close()
    return render_template('customer_viewsilverbangles.html',data=data)

@app.route('/customer_viewsilverchains',methods=['GET','POST'])
def customer_viewsilverchains():
    if request.method == 'GET':
         cur = connection.cursor()
         cur.execute("SELECT * FROM product WHERE product_ornament='Chains' AND product_category='Silver'")
         data = cur.fetchall()
         cur.close()
    return render_template('customer_viewsilverchains.html',data=data)
        
@app.route('/customer_viewsilverearrings',methods=['GET','POST'])
def customer_viewsilverearrings():
    if request.method == 'GET':
         cur = connection.cursor()
         cur.execute("SELECT * FROM product WHERE product_ornament='Earrings' AND product_category='Silver'")
         data = cur.fetchall()
         cur.close()
    return render_template('customer_viewsilverearrings.html',data=data)

@app.route('/customer_viewsilverpendants',methods=['GET','POST'])
def customer_viewsilverpendants():
    if request.method == 'GET':
         cur = connection.cursor()
         cur.execute("SELECT * FROM product WHERE product_ornament='Pendants' AND product_category='Silver'")
         data = cur.fetchall()
         cur.close()
    return render_template('customer_viewsilverpendants.html',data=data)
                      
@app.route('/customer_viewsilverrings',methods=['GET','POST'])
def customer_viewsilverrings():
    if request.method == 'GET':
         cur = connection.cursor()
         cur.execute("SELECT * FROM product WHERE product_ornament='Rings' AND product_category='Silver'")
         data = cur.fetchall()
         cur.close()
    return render_template('customer_viewsilverrings.html',data=data)       

@app.route('/customer_viewsilvernecklace',methods=['GET','POST'])
def customer_viewsilvernecklace():
    if request.method == 'GET':
         cur = connection.cursor()
         cur.execute("SELECT * FROM product WHERE product_ornament='Necklace' AND product_category='Silver'")
         data = cur.fetchall()
         cur.close()
    return render_template('customer_viewsilvernecklaces.html',data=data)

@app.route('/customer_viewdiamondbangles',methods=['GET','POST'])
def customer_viewdiamondbangles():
    if request.method == 'GET':
         cur = connection.cursor()
         cur.execute("SELECT * FROM product WHERE product_ornament='Bangles' AND product_category='Diamond'")
         data = cur.fetchall()
         cur.execute("SELECT * FROM product WHERE product_ornament='Bracelets' AND product_category='Diamond'")
         data1 = cur.fetchall()
         cur.close()
    return render_template('customer_viewdiamondbangles.html',data=data,data1=data)

@app.route('/customer_viewdiamondearrings',methods=['GET','POST'])
def customer_viewdiamondearrings():
    if request.method == 'GET':
         cur = connection.cursor()
         cur.execute("SELECT * FROM product WHERE product_ornament='Earrings' AND product_category='Diamond'")
         data = cur.fetchall()
         cur.close()
    return render_template('customer_viewdiamondearrings.html',data=data)

@app.route('/customer_viewdiamondpendants',methods=['GET','POST'])
def customer_viewdiamondpendants():
    if request.method == 'GET':
         cur = connection.cursor()
         cur.execute("SELECT * FROM product WHERE product_ornament='Pendants' AND product_category='Diamond'")
         data = cur.fetchall()
         cur.close()
    return render_template('customer_viewdiamondpendants.html',data=data)
                      
@app.route('/customer_viewdiamondrings',methods=['GET','POST'])
def customer_viewdiamondrings():
    if request.method == 'GET':
         cur = connection.cursor()
         cur.execute("SELECT * FROM product WHERE product_ornament='Rings' AND product_category='Diamond'")
         data = cur.fetchall()
         cur.close()
    return render_template('customer_viewdiamondrings.html',data=data)
          
@app.route('/customer_viewdiamondnecklace',methods=['GET','POST'])
def customer_viewdiamondnecklace():
    if request.method == 'GET':
         cur = connection.cursor()
         cur.execute("SELECT * FROM product WHERE product_ornament='Necklace' AND product_category='Diamond'")
         data = cur.fetchall()
         cur.close()
    return render_template('customer_viewdiamondnecklaces.html',data=data)

@app.route('/customer_viewdiamondnosepins',methods=['GET','POST'])
def customer_viewdiamondnosepins():
    if request.method == 'GET':
         cur = connection.cursor()
         cur.execute("SELECT * FROM product WHERE product_ornament='Nosepins' AND product_category='Diamond'")
         data = cur.fetchall()
         cur.close()
    return render_template('customer_viewdiamondnosepins.html',data=data)

@app.route('/customer_viewelena',methods=['GET','POST'])
def customer_viewelena():
    if request.method == 'GET':
         cur = connection.cursor()
         cur.execute("SELECT * FROM product WHERE product_ornament='Elena' AND product_category='Silver'")
         data = cur.fetchall()
         cur.close()
    return render_template('customer_viewelena.html',data=data)

@app.route('/customer_viewgina',methods=['GET','POST'])
def customer_viewgina():
    if request.method == 'GET':
         cur = connection.cursor()
         cur.execute("SELECT * FROM product WHERE product_ornament='Gina' AND product_category='Silver'")
         data = cur.fetchall()
         cur.close()
    return render_template('customer_viewgina.html',data=data)

@app.route('/add_to_cart',methods=['GET','POST'])
def customer_cartin():
    if request.method == 'POST':
         product_id = request.form.get('product_id')
         customer_id = session['customer_id']
         now = datetime.datetime.now()
         cur = connection.cursor()
         cur.execute("INSERT INTO cart(customer_id,product_id,added_date) VALUES(%s,%s,%s)",(customer_id,product_id,now))
         cur.execute("INSERT INTO order_summary(customer_id,product_id,order_date) VALUES(%s,%s,%s)",(customer_id,product_id,now))
         connection.commit()
         cur.close()
         flash('The Product has been Added to the Cart','success')
         return redirect(url_for('customer_cart'))
    return render_template('customer_cart.html')
   
@app.route('/customer_cart',methods=['GET','POST'])
def customer_cart():
    if request.method == 'GET':
         customer_id = session['customer_id']
         cur = connection.cursor()
         #cur.execute("SELECT product.*, cart.cart_id from product join cart on product.product_id = cart.product_id  WHERE cart.customer_id=%s",[customer_id])
         #data = cur.fetchall()
         cur.execute("SELECT SUM(product.product_price) FROM product join cart on product.product_id = cart.product_id  WHERE customer_id=%s",[customer_id])
         result = cur.fetchone()
         print(result)
         cur.execute("SELECT product.*,cart.cart_id from product,cart where  product.product_id = cart.product_id AND customer_id = %s",[customer_id])
         cartid = cur.fetchall()
         cur.close()
    return render_template('customer_cart.html',result=result,cartid=cartid)

@app.route('/delete_product/<string:id>', methods=['POST'])
def customer_deletecartproduct(id):
    cur = connection.cursor()
    customer_id = session['customer_id']
    cur.execute("DELETE FROM cart WHERE product_id = %s AND customer_id=%s", [id,customer_id])
    cur.execute("DELETE FROM order_summary WHERE product_id = %s AND customer_id=%s", [id,customer_id])
    cur.close()
    flash('Product Removed from Cart', 'success')
    return redirect(url_for('customer_cart'))

@app.route('/customer_cartamount',methods=['GET','POST'])
def customer_cartamount():
    if request.method == 'POST':
         total_price = request.form.get('total_price')
         customer_id=session['customer_id']
         cur = connection.cursor()
         cur.execute("INSERT INTO cartamount(total_price,customer_id) VALUES(%s,%s)",(total_price,customer_id))
         connection.commit()
         cur.close()
         return redirect(url_for('placeorder'))
    return render_template('customer_cart.html')

@app.route('/placeorder',methods=['GET','POST'])
def placeorder():
    if request.method == 'POST':
         name= request.form.get('name')
         phonenumber = request.form.get('phonenumber')
         address = request.form.get('address')
         town = request.form.get('town')
         city = request.form.get('city')
         state = request.form.get('state')
         pincode = request.form.get('pincode')
         country = request.form.get('country')
         customer_id=session['customer_id']
         now = datetime.datetime.now()
         cur = connection.cursor()
         cur.execute("INSERT INTO porder(customer_id,name,phonenumber,address,town,city,state,pincode,country,order_date) VALUES(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)",(customer_id,name,phonenumber,address,town,city,state,pincode,country,now))
       
         connection.commit()
         cur.close()
         flash('Order placed successfully','success')
         return redirect(url_for('customer_bill'))
    return render_template('placeorder.html')

@app.route('/admin_viewproducts',methods=['GET','POST'])
def admin_viewproducts():
    if request.method == 'GET':
         cur = connection.cursor()
         cur.execute("SELECT * FROM product")
         data = cur.fetchall()
         cur.close()
    return render_template('admin_viewproducts.html',data=data)

@app.route('/filter',methods=['GET','POST'])
def customer_filter():
    if request.method == 'POST':
         product_category = request.form.get('product_category')
         product_ornament = request.form.get('product_ornament')
         product_price = request.form.get('product_price')
         cur = connection.cursor()
         cur.execute("SELECT * FROM product WHERE product_category=%s AND product_ornament=%s",(product_category,product_ornament))
         data = cur.fetchall()
         cur.close()         
    return render_template('filter.html',data=data)

@app.route('/search',methods=['GET','POST'])
def customer_search():
    if request.method == 'POST':
         search = request.form.get('search')
         cur = connection.cursor()
         cur.execute("SELECT * FROM product WHERE product_category=%s OR product_ornament=%s ",(search,search))
         data = cur.fetchall()
         cur.close()         
    return render_template('search.html',data=data)

@app.route('/ordersummary',methods=['GET','POST'])
def customer_ordersummary():
    if request.method == 'GET':
        customer_id = session['customer_id']
        cur = connection.cursor()
        cur.execute("SELECT product.*,order_summary.order_date from product,order_summary where  product.product_id = order_summary.product_id AND customer_id = %s",[customer_id])
        data = cur.fetchall()
        cur.close()
    return render_template('customer_ordersummary.html',data=data)

@app.route('/admin_ordersummary',methods=['GET','POST'])
def admin_ordersummary():
    if request.method == 'GET':
        cur = connection.cursor()
        cur.execute("SELECT product.*,order_summary.order_date,user.customer_name from product,order_summary,user where  product.product_id = order_summary.product_id AND order_summary.customer_id=user.customerid")
        data = cur.fetchall()
        cur.close()
    return render_template('admin_ordersummary.html',data=data)

@app.route('/adminorder',methods=['GET','POST'])
def adminorder():
    if request.method == 'POST':
         order_date = request.form.get('order_date')
         order1_date = request.form.get('order1_date')
         cur = connection.cursor()
         cur.execute("SELECT product.*,order_summary.order_date,user.customer_name from product,order_summary,user where  product.product_id = order_summary.product_id AND order_summary.customer_id=user.customerid AND order_summary.order_date BETWEEN %s AND %s",[order_date,order1_date])
         data = cur.fetchall()
         cur.close()         
    return render_template('admin_ordersummary.html',data=data)

"""@app.route('/customer_bill',methods=['GET','POST'])
def customer_bill():
    if request.method == 'GET':
        customer_id = session['customer_id']
        cur = connection.cursor()
        cur.execute("SELECT * from user where customerid=%s",[customer_id])
        customer = cur.fetchone()
        cur.execute("SELECT product.*,order_summary.order_date from product,order_summary where  product.product_id = order_summary.product_id AND customer_id = %s",[customer_id])
        data = cur.fetchall()
        cur.execute("SELECT SUM(product.product_price) FROM product join cart on product.product_id = cart.product_id   WHERE customer_id=%s",[customer_id])
        result1 = cur.fetchone()
        result = int(result1[0])        
        if (result > 0):
            if result <= 5000:
                 discount = result * 0.02
            elif result >= 10000 and result <=25000:
                 discount = result * 0.05
            elif result >= 25000 and result <=50000:
                 discount = result * 0.07
            elif result >= 50000 and result <=75000:
                 discount = result * 0.09
            elif result >= 75000 and result <=100000:
                 discount = result * 0.12
            elif result >= 100000 and result <=300000:
                 discount = result * 0.15
            elif result >=300000:
                 discount = result * 0.17
        print(discount)
        total = result-discount
        print(total)
        cur.close()
    return render_template('customer_bill.html',data=data,customer=customer,result=result1,discount=discount,total=total)"""

@app.route('/admin_addoffer',methods=['GET','POST'])
def admin_addoffer():
    if request.method == 'POST':
        min_val = request.form.get('min_value')
        max_val = request.form.get('max_value')
        discount = request.form.get('discount')
        discount_val = request.form.get('discount_val')
        cur = connection.cursor()
        cur.execute("INSERT into offer(min_value,max_value,discount,discount_val) VALUES(%s,%s,%s,%s)",(min_val,max_val,discount,discount_val))
        connection.commit()
        cur.close()
        flash('Loyalty score added successfully','success')
    return render_template('admin_addoffer.html')


@app.route('/admin_viewoffer',methods=['GET','POST'])
def admin_viewoffer():
    if request.method == 'GET':
        cur = connection.cursor()
        cur.execute("SELECT * from offer")
        offer = cur.fetchall()
        cur.close()
    return render_template('admin_viewoffer.html',data=offer)

@app.route('/admin_deleteoffer/<string:id>', methods=['POST'])
def admin_deleteoffer(id):
    cur = connection.cursor()
    cur.execute("DELETE FROM offer WHERE offer_id = %s", [id])
    cur.close()
    flash('Offer deleted successfully', 'success')
    return redirect(url_for('admin_viewoffer'))

@app.route('/admin_editoffer/<string:id>',methods=['GET','POST'])
def admin_editoffer(id):
    cur = connection.cursor()
    cur.execute("SELECT * FROM offer WHERE offer_id=%s",[id])
    data = cur.fetchone()
    cur.close()
    if request.method == 'POST':
        min_val = request.form.get('min_value')
        max_val = request.form.get('max_value')
        discount = request.form.get('discount')
        discount_val = request.form.get('discount_val')
        cur = connection.cursor()
        cur.execute("UPDATE offer SET min_value=%s, max_value=%s, discount=%s, discount_val=%s where offer_id=%s",(min_val,max_val,discount,discount_val,id))
        cur.close()
        flash('Modified successfully','success')
        return redirect(url_for('admin_viewoffer'))
    return render_template('admin_editoffer.html',data=data)


@app.route('/customer_bill',methods=['GET','POST'])
def customer_bill():
    if request.method == 'GET':
        customer_id = session['customer_id']
        cur = connection.cursor()
        cur.execute("SELECT * from user where customerid=%s",[customer_id])
        customer = cur.fetchone()
        cur.execute("SELECT product.*,order_summary.order_date from product,order_summary where product.product_id = order_summary.product_id AND customer_id = %s",[customer_id])
        data = cur.fetchall()
        cur.execute("SELECT SUM(product.product_price) FROM product join cart on product.product_id = cart.product_id   WHERE customer_id=%s",[customer_id])
        result1 = cur.fetchone()        
        result = int(result1[0])
        print(result)
        cur.execute("SELECT COUNT(customer_id) from order_summary where customer_id=%s",[customer_id])
        data1 = cur.fetchone()
        cuscount = int(data1[0])
        print(data1)
        print(cuscount)
        if cuscount >1 :
            cur.execute("SELECT discount_val from offer where min_value<%s AND max_value>%s",[result,result])
            dis = cur.fetchone()
            discount_val = float(dis[0])
            print(discount_val)
            total_val = result*discount_val
            total_price = result - total_val
            print(total_price)
            cur.close()
        else:
            total_val = 0 
            total_price = result
            print(result)
    return render_template('customer_bill.html',data=data,customer=customer,result=result1,discount=total_val,total=total_price)




if __name__=='__main__':
    app.secret_key='secret978'
    app.run(debug=True)
