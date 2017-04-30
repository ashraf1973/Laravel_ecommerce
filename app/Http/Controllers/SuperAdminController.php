<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests;
use DB;
use Session;
use Redirect;

class SuperAdminController extends Controller {

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index() {
        //
        $dashbord = view('admin.pages.dashboard');
        return view('admin.admin_master')->with('content', $dashbord);
    }

    public function category() {
        $categories = DB::table('category')
                ->where('deletion_status', 1)
                ->get();
        $categories_info = view('admin.pages.manage_category')->with('categories', $categories);
        return view('admin.admin_master')->with('content', $categories_info);
    }

    public function add_category() {
        $categories = DB::table('category')
                ->where('deletion_status', 1)
                ->where('publication_status', 1)
                ->get();
        $add_categories_form = view('admin.pages.add_category')->with('category_info', $categories);
        return view('admin.admin_master')->with('content', $add_categories_form);
    }

    public function save_category(Request $request) {
        $data = array();
        $data['category_name'] = $request->category_name;
        $data['category_description'] = $request->category_description;
        $data['parent_id'] = $request->parent_id;
        DB::table('category')->insert($data);
        Session::flash('massage', 'Save Category Information Successfully !');
        return Redirect::to('/manage-category');
//        $data['']=$request->;
//        $data['']=$request->;
//        $data['']=$request->;
    }

    public function edit_category($id) {
        $category_by_id = DB::table('category')
                ->select('*')
                ->where('id', $id)
                ->first();
        $categories = DB::table('category')
                ->where('deletion_status', 1)
                ->get();
        // print_r($category_by_id);exit();
        $edit_category_form = view('admin.pages.edit_category')
                        ->with('category_info', $category_by_id)->with('all_category_info', $categories)
        ;
        return view('admin.admin_master')->with('content', $edit_category_form);
    }
    public function update_category(Request $request) {
        $data = array();
        $data['category_name'] = $request->category_name;
        $category_id = $request->category_id;
        $data['category_description'] = $request->category_description;
        $data['parent_id'] = $request->parent_id;
        DB::table('category')
                ->where('id', $category_id)
                ->update($data);
        Session::flash('massage', 'Update Category Information Successfully !');
        return Redirect::to('/manage-category');
//        $data['']=$request->;
//        $data['']=$request->;
//        $data['']=$request->;
    }

    public function unpublished_category($id) {
        DB::table('category')
                ->where('id', $id)
                ->update(['publication_status' => 0]);
        Session::flash('massage', 'Category Unpublished successfully');
        return Redirect::to('/manage-category');
    }

    public function published_category($id) {
        DB::table('category')
                ->where('id', $id)
                ->update(['publication_status' => 1]);
        Session::flash('massage', 'Category published successfully');
        return Redirect::to('/manage-category');
    }

    public function delete_category($id) {
        DB::table('category')
                ->where('id', $id)
                ->delete();
        Session::flash('massage', 'Category Delete successfully');
        return Redirect::to('/manage-category');
    }

    public function arcive_category() {
        $categories = DB::table('category')
                ->where('deletion_status', 0)
                ->get();
        $categories_info = view('admin.pages.archive_category')->with('categories', $categories);
        return view('admin.admin_master')->with('content', $categories_info);
    }

    public function up_category($id) {
        DB::table('category')
                ->where('id', $id)
                ->update(['deletion_status' => 1]);
        Session::flash('massage', 'Category Up successfully');
        return Redirect::to('/manage-category');
    }

    public function manage_manufacture() {
        $manufacture = DB::table('manufacture')
                ->where('deletion_status', 1)
                ->get();
        $categories_info = view('admin.pages.manage_manufacture')->with('manufacture', $manufacture);
        return view('admin.admin_master')->with('content', $categories_info);
    }

    public function add_manufacture() {

        $add_manufacture_form = view('admin.pages.add_manufacture');
        return view('admin.admin_master')->with('content', $add_manufacture_form);
    }

    public function save_manufacture(Request $request) {
        $data = array();
        $data['manufacture_name'] = $request->manufacture_name;
        $data['publication_status'] = $request->publication_status;
        $data['manufacture_description'] = $request->manufacture_description;
        DB::table('manufacture')->insert($data);
        Session::flash('massage', 'Save manufacture Information Successfully !');
        return Redirect::to('/manage-manufacture');
    }

    public function unpublished_manufacture($id) {
        DB::table('manufacture')
                ->where('id', $id)
                ->update(['publication_status' => 0]);
        Session::flash('massage', ' Unpublished successfully');
        return Redirect::to('/manage-manufacture');
    }

    public function published_manufacture($id) {
        DB::table('manufacture')
                ->where('id', $id)
                ->update(['publication_status' => 1]);
        Session::flash('massage', ' published successfully');
        return Redirect::to('/manage-manufacture');
    }

    public function manage_product() {
        $product = DB::table('product')
                ->where('deletion_status', 1)
                ->get();
        $manage_product_info = view('admin.pages.manage_product')->with('product', $product);
        return view('admin.admin_master')->with('content', $manage_product_info);
    }

    public function add_product() {
        $categories = DB::table('category')
                ->where('deletion_status', 1)
                ->where('publication_status', 1)
                ->get();
        $manufacture = DB::table('manufacture')
                ->where('deletion_status', 1)
                ->where('publication_status', 1)
                ->get();
        $add_product_form = view('admin.pages.add_product')
                ->with('category_info', $categories)
                ->with('manufacture', $manufacture);
        return view('admin.admin_master')->with('content', $add_product_form);
    }

    public function save_product(Request $request) {

//        echo '<pre>';
//        print_r($_FILES);
        //exit();
//        echo $request->is_featured;
//        exit();
        $data = array();
        $data['product_name'] = $request->product_name;
        $data['category_id'] = $request->category_id;
        $data['manufacture_id'] = $request->manufacture_id;
        $data['short_description'] = $request->short_description;
        $data['long_description'] = $request->long_description;
        if ($request->is_featured == 'on') {
            $data['is_featured'] = 1;
        }

        $data['new_price'] = $request->new_price;
        $data['old_price'] = $request->old_price;
        $data['product_status'] = $request->product_status;
        $data['stock'] = $request->stock;
        $data['publication_status'] = $request->publication_status;
        //echo "<pre>";
        // print_r($data);
        $product_id = DB::table('product')->insertGetId($data);
        
        //$this->do_upload($request,$product_id);
        $this->do_upload($request,$product_id);
        Session::flash('massage', 'Save Probuct Information Successfully !');
        return Redirect::to('/manage-product');
    }
    public function do_upload($request,$product_id)
    {
        $picture = '';
        $i=1;
        if ($request->hasFile('product_image')) 
        {
        $files = $request->file('product_image');
        foreach($files as $file){
        $filename = $file->getClientOriginalName();
        //$extension = $file->getClientOriginalExtension();
        $picture = date('His').$filename;
        $image_url='product_image/'.$picture;
        $destinationPath = base_path() . '\product_image';
        $success=$file->move($destinationPath, $picture);
            
         
                if ($success) {
                    $idata = array();
                    $idata['product_id'] = $product_id;
                    $idata['image_option'] = $image_url;
                    if ($i===1) {
                        $idata['image_label'] = 1;
                    } else {
                        $idata['image_label'] = 0;
                    }

                    DB::table('tbl_product_image')->insert($idata);
                }
                else{
                    echo "Upload Error";
                }
                $i++;
        }
        }
        return;
    }
    public function delete_manufacture($id)
    {
        DB::table('manufacture')
                ->where('id',$id)
                ->update(['deletion_status' => 0]);
        Session::flash('massage', ' delete successfully');
        return Redirect::to('/manage-manufacture');
                
    }
    public function delete_product($product_id)
    {
        DB::table('product')
                ->where('id',$product_id)
                ->delete();
        return Redirect::to('/manage-product');
    }
	public function published_product($product_id) {
        DB::table('product')
                ->where('id', $product_id)
                ->update(['publication_status' => 1]);
        Session::flash('massage', ' published successfully');
        return Redirect::to('/manage-product');
    }
	public function unpublished_product($product_id) {
        DB::table('product')
                ->where('id', $product_id)
                ->update(['publication_status' => 0]);
        Session::flash('massage', ' unpublished successfully');
        return Redirect::to('/manage-product');
    }
	public function edit_product($product_id) {
        $categories = DB::table('category')
                ->where('deletion_status', 1)
                ->where('publication_status', 1)
                ->get();
        $manufacture = DB::table('manufacture')
                ->where('deletion_status', 1)
                ->where('publication_status', 1)
                ->get();
        
        $edit_product = view('admin.pages.edit_product')
                ->with('category_info', $categories)
                ->with('manufacture', $manufacture);
        return view('admin.admin_master')->with('content', $edit_product);
    }

    public function logout() {
        Session::put('admin_id', '');
        Session::put('admin_name', '');
        Session::flash('message', "You are successfully logout");
        return Redirect::to('/admin-panel');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create() {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request) {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id) {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id) {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id) {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id) {
        //
    }

}
