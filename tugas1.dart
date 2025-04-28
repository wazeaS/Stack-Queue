class CircularQueue {
  List<int> element;
  int front;
  int rear;
  int maxQueue;

  CircularQueue(this.maxQueue)
      : element = List.filled(maxQueue, 0),
        front = 0,
        rear = -1;

  bool isFull() {
    return (rear + 1) % maxQueue == front;
  }

  bool isEmpty() {
    return front == (rear + 1) % maxQueue;
  }

  void enqueue(int data) {
    if (isFull()) {
      print("Queue Overflow, tidak dapat mengisi data lagi");
    } else {
      rear = (rear + 1) % maxQueue; // Menggunakan modulus untuk circular
      element[rear] = data;
    }
  }

  int dequeue() {
    if (isEmpty()) {
      print("Queue Underflow");
      return -1; // Mengembalikan -1 jika antrian kosong
    } else {
      int data = element[front];
      element[front] = 0; // Menghapus data
      front = (front + 1) % maxQueue; // Memindahkan front
      return data;
    }
  }

  void display() {
    if (isEmpty()) {
      print("Antrian kosong");
      return;
    }
    print("Isi antrian: ");
    for (int i = front; i != (rear + 1) % maxQueue; i = (i + 1) % maxQueue) {
      print(element[i]);
    }
  }
}

void main() {
  CircularQueue queue = CircularQueue(5); // Membuat antrian dengan kapasitas 5

  queue.enqueue(10);
  queue.enqueue(20);
  queue.enqueue(30);
  queue.enqueue(40);
  queue.enqueue(50);
  queue.enqueue(60); // Ini akan menampilkan "Queue Overflow"

  queue.display();

  print("Data yang dikeluarkan: ${queue.dequeue()}");
  print("Data yang dikeluarkan: ${queue.dequeue()}");

  queue.display();

  queue.enqueue(60);
  queue.display();
}