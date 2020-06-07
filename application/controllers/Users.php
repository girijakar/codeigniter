<?php
   class Users extends CI_Controller{
   	public function register(){
   		$data['title']='Sign Up';
   		$this->form_validation->set_rules('name','Name','required');
   		$this->form_validation->set_rules('username','UserName','required|callback_check_username_exists');
   		$this->form_validation->set_rules('email','Email','required|callback_check_email_exists');
   		$this->form_validation->set_rules('password','Password','required');
   		$this->form_validation->set_rules('password2','Confirm Password','required');
   		$this->form_validation->set_rules('','','matches[password]');
   		if ($this->form_validation->run()===FALSE) {
   			$this->load->view('templates/header');
   			$this->load->view('users/register',$data);
   			$this->load->view('templates/footer');
   		}else{
             //Encrypt password
             $enc_password=md5($this->input->post('password'));
             $this->user_model->register($enc_password); 
             //Set Message
             $this->session->set_flashdata('user_registered','You are Fucked Up');
             redirect('posts');
   		}

   	}
   		public function login(){
   		$data['title']='Sign In';
   		$this->form_validation->set_rules('username','UserName','required');
   		$this->form_validation->set_rules('password','Password','required');
   		if ($this->form_validation->run()===FALSE) {
   			$this->load->view('templates/header');
   			$this->load->view('users/login',$data);
   			$this->load->view('templates/footer');
   		}else{
              //Get Username and password
   			$username=$this->input->post('username');
            $password=md5($this->input->post('password'));
            //Login User
            $user_id=$this->user_model->login($username,$password);  if($user_id){
            	$user_data=array(
                  'user_id'=>$user_id,
                  'username'=>$username,
                  'logged_in'=>true
            	);
            	$this->session->set_userdata($user_data);
             //Set Message
            $this->session->set_flashdata('user_loggedin','You are Logged IN');
             redirect('posts');
            }else{
            //Set Message
             $this->session->set_flashdata('login_failed','Login is Invalid');
             redirect('users/login');	
            }
             
   		}

   	}
   	public function logout(){
   		//unset user data
   		$this->session->unset_userdata('logged_in');
   		$this->session->unset_userdata('user_id');
   		$this->session->unset_userdata('username');
   		$this->session->set_flashdata('user_loggedout','You are Logged out');
   		redirect('users/login');
   	}
   	//Check username exists
   	public function check_username_exists($username){
   		$this->form_validation->set_message('check_username_exists',"That UserName is Taken.Please choose a different one");
   		if($this->user_model->check_username_exists($username)){
            return true;
   		}else{
             return false;
   		}
   	} 
   public function check_email_exists($email){
   		$this->form_validation->set_message('check_email_exists',"That Email is Taken.Please choose a different one");
   		if($this->user_model->check_email_exists($email)){
            return true;
   		}else{
             return false;
   		}
   	} 
   }